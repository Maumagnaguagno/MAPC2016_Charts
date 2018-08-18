begin
  if ARGV.empty?
    puts "Usage:
  ruby preprocess.rb matchX_folder
  Writes CSV file at matchX_folder/matchX_folder.csv"
  else
    # Each simulation is a folder with 1001 XML step files
    xml_folder = ARGV.first
    values = ''
    1001.times {|index|
      # <team jobs="XXX" money="($1)" name="($2)"/>
      # <team jobs="XXX" money="($3)" name="($4)"/>
      xml = IO.read("#{xml_folder}/#{xml_folder}_#{index}.xml")
      xml =~ /<team jobs="[^"]*" money="([^"]*)" name="([^"]*)"\/>\n<team jobs="[^"]*" money="([^"]*)" name="([^"]*)"\/>/
      values << "\n#{index},#{$1},#{$3}"
    }
    IO.binwrite("#{xml_folder}/#{xml_folder}.csv", "Step,#{$2},#{$4}" << values)
  end
end