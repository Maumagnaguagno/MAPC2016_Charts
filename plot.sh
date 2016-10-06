set terminal svg size 400,300 enhanced fname 'arial'  fsize 10 butt solid
set output 'out.svg'
set key inside bottom right
set xlabel 'Step'
set ylabel 'Money'
set style fill pattern 4 bo
set title 'Flisvos-2016 vs PUCRS - simulation 3 of 3'
plot  "data.txt" using 1:2 lt rgb "blue" title 'Flisvos-2016' with lines,\
      "data.txt" using 1:3 lt rgb "red"  title 'PUCRS' with lines