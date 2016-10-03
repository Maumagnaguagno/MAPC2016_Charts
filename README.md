# MAPC2016 Charts
**Multi-Agent Programming Contest 2016 - Result Charts**

Charts were generated from the [Multi-Agent Programming Contest 2016](https://multiagentcontest.org/2016/) results.

They are online [here](https://maumagnaguagno.github.io/MAPC2016_Charts/).

Each match between 2 teams resulted in 3 simulations of a 1000 steps each.
Each simulation record is stored in a folder with 1001 XML files referring to each simulation step.
The script ``preprocess.rb`` reads an entire simulation folder collecting information about team's money at each step to generate a single CSV file to be used as data for the charts.
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

The CSV files are used in Google Sheets to generate and publish the charts using Area charts (using row 1 as headers and column A as lables).