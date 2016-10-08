# MAPC2016 Charts
**Multi-Agent Programming Contest 2016 - Result Charts**

Charts were generated from the [Multi-Agent Programming Contest 2016](https://multiagentcontest.org/2016/) results.

They are [online!](https://maumagnaguagno.github.io/MAPC2016_Charts/)

Each match between 2 teams resulted in 3 simulations of a 1000 steps each.
Each simulation record is stored in a folder with 1001 XML files referring to each simulation step.
Script ``preprocess.rb`` reads an entire simulation folder collecting information about team's money at each step to generate a single CSV file to be used as data for the charts.
This step may take time with a slow hard disk, but you can use the already preprocessed CSVs in the folders.

```Shell
# 3 matches are inside the zip
unzip dayXmatchY.zip
# The script expects to be where you unzipped
ruby preprocess.rb matchX_folder
# CSV file is at matchX_folder/matchX_folder.csv
```

The CSV files look like this:

```
Step,BathTUB,Python-DTU
0,50000,50000
1,50000,50000
2,50000,50000
3,50000,50000
...
998,-640533,49725
999,-640533,49725
1000,-640533,49725
```

The CSV files can be used with Google Sheets to generate and publish the charts using Area charts (using row 1 as headers and column A as labels).
Currently the charts are generated using [Google Charts](https://developers.google.com/chart/interactive/docs/gallery/areachart) without Google Sheets.
Although they look the same, Google charts use the files from the repository and generates the charts on the client-side instead of transferring charts from Google Sheets.

Script ``analyze.rb`` reads datasets to solve the following questions:
- How much of the money in game each team have (total and percentage)?
- How many steps each team dominated the game (total and percentage)?
- The result was expected? The team that dominated most of the game won the match?

The script works in two modes:

```Shell
# Read all CSV files in folders at current dir
ruby analyze.rb
# Read specified CSV files (one or more)
ruby analyze.rb "day1match1 BathTUB Python-DTU/City2016_BathTUBPython-DTU_2016-tournament-sim1of3_2016-09-12_13-00.csv"
```

Both modes output results like this to screen:

```
____BathTUB vs Python-DTU - simulation 1 of 3_____
       BathTUB made      -640533$ (-92.80%)
    Python-DTU made        49725$ (7.20%)
       BathTUB dominated    0 steps (0.00%)
    Python-DTU dominated  988 steps (98.80%)
          draw dominated   12 steps (1.20%)
         Expected result (won most steps)
```