# MAPC2016 Charts
**Multi-Agent Programming Contest 2016 - Result Charts**

Charts were generated from the [Multi-Agent Programming Contest 2016](https://multiagentcontest.org/2016/) results.

They are online [here](https://maumagnaguagno.github.io/MAPC2016_Charts/).

Each match between 2 teams resulted in 3 simulations of a 1000 steps each.
Each simulation record is stored in a folder with 1001 XML files referring to each step.
The script ``analyze.rb`` reads an entire simulation folder to generate a CSV file to be used as data for the charts.

```Shell
# 3 matches are inside the zip
unzip dayXmatchY.zip
# The script expects to be where you unzipped
ruby analyze.rb matchX_folder
# CSV file is at matchX_folder/matchX_folder.csv
```

The CSV files are used in Google Sheets to generate and publish the charts.
- Area chart
- Row 1 as headers
- Column A as labels