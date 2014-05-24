Getting and Cleaning Data - Course Project
===========

This project uses a data set from UCI on [Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to practice retrieving, cleaning and processing data using R.

### The project includes the following files

| File/Path                | Description                                                               |
|--------------------------|---------------------------------------------------------------------------|
| ./README.md              | Project description including instructions to install and run the scripts |
| ./scripts/run_analysis.R | Main script to generate the tidy data set                                 |
| ./scripts/loadData.R     | Used by the main script to load, merge and transform HAR data             |
| ./tidydata/CodeBook.md   | Codebook for the tidy dataset                                             |
| ./tidydata/tidydata.csv  | The tidy data set                                                         |

### Installing and running the scripts

1. Download the [raw data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it to a directory of your local hard-drive, e.g. c:/coursera/.
2. Copy run_analysis.R and loadData.R to that directory
3. Using the example directory you should now have the following two directories:
3.1 'c:/coursera/' containing both scripts
3.2 'c:/coursera/UCI HAR Dataset' Cointaining the raw dataset (activity_labels.txt, features.txt, etc.)
4. If you changed the directory name of the raw data set you have to update the data.dir variable in the run_analysis.R accordingly
5. Open RStudio and set the R working directory to the directory containing the scripts
6. Run run_analysis.R

### How the scripts work and how they are connected
The raw data is split into a training and a test set. Both sets have an identical file and data structre. Therefore I use one script (loadData.R) to load, merge and clean the data of a given set. loadData.R gets the directory of the raw data set and the type ('train' or 'test') as input and returns the cleansed data set as a data.frame. The main script run_analysis.R only calls loadData for the test and the training data, merges both sets and computes the means for the data columns groupy by subject and activity.