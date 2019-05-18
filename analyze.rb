begin
  # Use all datasets if none given
  (ARGV.empty? ? Dir.glob('*/*.csv') : ARGV).each {|dataset|
    csv = IO.binread(dataset).split("\n")
    _, team_a, team_b = csv.shift.split(',')
    dominion_a = dominion_b = dominion_draw = 0
    # Skip setup step
    1.upto(1000) {|row|
      row = csv[row].split(',')
      # Team dominance
      case row[1].to_i <=> row[2].to_i
      when 1 then dominion_a += 1
      when -1 then dominion_b += 1
      else dominion_draw += 1
      end
    }
    # Output
    row = csv[1000].split(',')
    money_a = row[1].to_i
    money_b = row[2].to_i
    puts "#{team_a} vs #{team_b} - simulation #{dataset[/sim(\d+)of3/,1]} of 3".center(50, '_'),
         sprintf('%14s made %12d$ (%.2f%%)', team_a, money_a, money_a.fdiv(money_a.abs + money_b.abs) * 100),
         sprintf('%14s made %12d$ (%.2f%%)', team_b, money_b, money_b.fdiv(money_a.abs + money_b.abs) * 100),
         sprintf('%14s dominated %4d steps (%.2f%%)', team_a, dominion_a, dominion_a.fdiv(10)),
         sprintf('%14s dominated %4d steps (%.2f%%)', team_b, dominion_b, dominion_b.fdiv(10)),
         sprintf('%14s dominated %4d steps (%.2f%%)', 'draw', dominion_draw, dominion_draw.fdiv(10)),
         ((dominion_a <=> dominion_b) == (money_a <=> money_b) ? 'Expected result (won most steps)' : 'Unexpected result (lost most steps)').center(50)
  }
end