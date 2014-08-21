# Course Project for Coursera Getting and Cleaning Data, Aug 2014

## General

This repository is created as a part of the course project for Coursera Getting and Cleaning Data course.

It contains automated steps for creating a tidy data set from a raw data set.

## Raw data set

The raw data is not reproduced here. It is available from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The zipfile contains a detailed description of the raw data.

A general description of the raw data can be found on [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In short, the raw data is based on samplings from the accelerometer and gyroscope in a smartphone during physical acitivties performed by test subjects. Each subject has produced more than one data series per activity. The variables in the raw data set were each based on one such data series. The variables were, among others, mean and standard deviation of the data series or their Fourier transforms.

## Tidy data set

The tidy data set is based on the mean and standard deviation variables in the raw data set. Each variable in the tidy set is calculated as the mean of the raw data values with respect to subject and activity, i.e. generating one value for each combination of subject and activity.

Example: If subject 1 produced 17 data series for the activity "walking", then there are 17 values on e.g. the standard deviation of the untransformed (i.e. time domain) accelerometer readings in the X direction for gravity. The tidy data set only contains one value for the corresponding variable, calculated as the arithmetic mean of the 17 values.

## Files

- `README.md`
  This file.
- `CodeBook.md`
  Describes the variables in the `tidy_set.txt` file.
- `run_analysis.R`
  Script that can be used to recreate `tidy_set.txt` according to below.
- `tidy_set.txt`
  Tidy data set, bases on the raw data set above.
  It is described in [CodeBook.md](CodeBook.md).

## The script `run_analysis.R`

The script `run_analysis.R`, when sourced, creates two symbols in the global R scope, and one text file in the current working directory.

It creates the following symbols in the global environment:

* The function `run_analysis`.
* The variable `run_analysis_result`, which contains the result from `run_analysis()`. The variable contains a list with the following entries:
    - `run_analysis_result$merged_set`:
      Intermediate result, containing mean and standard deviation variables for all training and test data in the raw data set.
      These are the data that are used to calculate the mean values in the tidy set.
      There is thus more than one row for each combination of `subject` and `activity` here.
    - `run_analysis_result$tidy_set`:
      The tidy set, which is also available in `tidy_set.txt`.

The script automatically calls the `run_analysis` function. It also creates the file `tidy_set.txt` in the current working directory.

## Steps to create `tidy_data.txt`

General instructions:

1. Download and unpack the raw data set from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
1. Clone this repository, using the command `git clone https://github.com/andreaskalin/GettingAndCleaningDataCourseProject.git`
1. Start `R`.
1. Change directory to the unzipped raw data directory, by typing something similar to `setwd("/path/to/UCI HAR Dataset/")` from the `R` prompt. (The directory `UCI HAR Dataset` is the unzipped directory.)
1. Source `run_analysis.R` by typing something similar to `source "/path/to/GettingAndCleaningDataCourseProject/run_analysis.R` from the `R` prompt. (The directory `GettingAndCleaningDataCourseProject` is where you cloned the repository to.)
1. The script automatically generates the `tidy_data.txt` file according to the previous section.

Detailed commands, to use in `bash` (in Linux, on Mac, or in Windows/Cygin, provided that git, wget, and zip are installed):

        bash$ wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip -O raw.zip
        bash$ unzip raw.zip
        bash$ git clone https://github.com/andreaskalin/GettingAndCleaningDataCourseProject.git
        bash$ cd "UCI HAR Dataset"
        bash$ ln -s ../GettingAndCleaningDataCourseProject/run_analysis.R  # To avoid specifying the path to run_analysis.R
        bash$ R
        > source("run_analysis.R")

