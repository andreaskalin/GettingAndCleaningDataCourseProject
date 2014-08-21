# Code book for tidy_set.txt

## General

This document describes the variables in the `tidy_set.txt` file.

All variables are _mean_ of other mean or standard deviation features in the raw data.

All variables are normalized and bounded within [-1,1].

## Raw data

The raw data is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Variable details

### Key columns

The key columns are categorical.

Each key column pair is unique and identify a row in the tidy set. The columns are:

- 1: `subject`
    - Identifier of the subject (person) who performed the activity.
    - Value range `[1:30]`
- 2: `activity`
    - Performed activity.
    - Value set: `laying`, `sitting`, `standing`, `walking`, `walking_downstairs`, `walking_upstairs`

### Variable columns

The variable columns are continuous in the interval [-1,1]. They are normalized and have no unit.

Each variable represents the mean of a feature in the raw data set, by subject and activity.

The following are the variables and the feature they are based on, in order:

- 3: `mean_time_body_accelerometer_x`: Based on `tBodyAcc-mean()-X`.
- 4: `mean_time_body_accelerometer_y`: Based on `tBodyAcc-mean()-Y`.
- 5: `mean_time_body_accelerometer_z`: Based on `tBodyAcc-mean()-Z`.
- 6: `standard_deviation_time_body_accelerometer_x`: Based on `tBodyAcc-std()-X`.
- 7: `standard_deviation_time_body_accelerometer_y`: Based on `tBodyAcc-std()-Y`.
- 8: `standard_deviation_time_body_accelerometer_z`: Based on `tBodyAcc-std()-Z`.
- 9: `mean_time_gravity_accelerometer_x`: Based on `tGravityAcc-mean()-X`.
- 10: `mean_time_gravity_accelerometer_y`: Based on `tGravityAcc-mean()-Y`.
- 11: `mean_time_gravity_accelerometer_z`: Based on `tGravityAcc-mean()-Z`.
- 12: `standard_deviation_time_gravity_accelerometer_x`: Based on `tGravityAcc-std()-X`.
- 13: `standard_deviation_time_gravity_accelerometer_y`: Based on `tGravityAcc-std()-Y`.
- 14: `standard_deviation_time_gravity_accelerometer_z`: Based on `tGravityAcc-std()-Z`.
- 15: `mean_time_body_accelerometer_jerk_x`: Based on `tBodyAccJerk-mean()-X`.
- 16: `mean_time_body_accelerometer_jerk_y`: Based on `tBodyAccJerk-mean()-Y`.
- 17: `mean_time_body_accelerometer_jerk_z`: Based on `tBodyAccJerk-mean()-Z`.
- 18: `standard_deviation_time_body_accelerometer_jerk_x`: Based on `tBodyAccJerk-std()-X`.
- 19: `standard_deviation_time_body_accelerometer_jerk_y`: Based on `tBodyAccJerk-std()-Y`.
- 20: `standard_deviation_time_body_accelerometer_jerk_z`: Based on `tBodyAccJerk-std()-Z`.
- 21: `mean_time_body_gyroscope_x`: Based on `tBodyGyro-mean()-X`.
- 22: `mean_time_body_gyroscope_y`: Based on `tBodyGyro-mean()-Y`.
- 23: `mean_time_body_gyroscope_z`: Based on `tBodyGyro-mean()-Z`.
- 24: `standard_deviation_time_body_gyroscope_x`: Based on `tBodyGyro-std()-X`.
- 25: `standard_deviation_time_body_gyroscope_y`: Based on `tBodyGyro-std()-Y`.
- 26: `standard_deviation_time_body_gyroscope_z`: Based on `tBodyGyro-std()-Z`.
- 27: `mean_time_body_gyroscope_jerk_x`: Based on `tBodyGyroJerk-mean()-X`.
- 28: `mean_time_body_gyroscope_jerk_y`: Based on `tBodyGyroJerk-mean()-Y`.
- 29: `mean_time_body_gyroscope_jerk_z`: Based on `tBodyGyroJerk-mean()-Z`.
- 30: `standard_deviation_time_body_gyroscope_jerk_x`: Based on `tBodyGyroJerk-std()-X`.
- 31: `standard_deviation_time_body_gyroscope_jerk_y`: Based on `tBodyGyroJerk-std()-Y`.
- 32: `standard_deviation_time_body_gyroscope_jerk_z`: Based on `tBodyGyroJerk-std()-Z`.
- 33: `mean_time_body_accelerometer_magnitude`: Based on `tBodyAccMag-mean()`.
- 34: `standard_deviation_time_body_accelerometer_magnitude`: Based on `tBodyAccMag-std()`.
- 35: `mean_time_gravity_accelerometer_magnitude`: Based on `tGravityAccMag-mean()`.
- 36: `standard_deviation_time_gravity_accelerometer_magnitude`: Based on `tGravityAccMag-std()`.
- 37: `mean_time_body_accelerometer_jerk_magnitude`: Based on `tBodyAccJerkMag-mean()`.
- 38: `standard_deviation_time_body_accelerometer_jerk_magnitude`: Based on `tBodyAccJerkMag-std()`.
- 39: `mean_time_body_gyroscope_magnitude`: Based on `tBodyGyroMag-mean()`.
- 40: `standard_deviation_time_body_gyroscope_magnitude`: Based on `tBodyGyroMag-std()`.
- 41: `mean_time_body_gyroscope_jerk_magnitude`: Based on `tBodyGyroJerkMag-mean()`.
- 42: `standard_deviation_time_body_gyroscope_jerk_magnitude`: Based on `tBodyGyroJerkMag-std()`.
- 43: `mean_frequency_body_accelerometer_x`: Based on `fBodyAcc-mean()-X`.
- 44: `mean_frequency_body_accelerometer_y`: Based on `fBodyAcc-mean()-Y`.
- 45: `mean_frequency_body_accelerometer_z`: Based on `fBodyAcc-mean()-Z`.
- 46: `standard_deviation_frequency_body_accelerometer_x`: Based on `fBodyAcc-std()-X`.
- 47: `standard_deviation_frequency_body_accelerometer_y`: Based on `fBodyAcc-std()-Y`.
- 48: `standard_deviation_frequency_body_accelerometer_z`: Based on `fBodyAcc-std()-Z`.
- 49: `mean_frequency_body_accelerometer_jerk_x`: Based on `fBodyAccJerk-mean()-X`.
- 50: `mean_frequency_body_accelerometer_jerk_y`: Based on `fBodyAccJerk-mean()-Y`.
- 51: `mean_frequency_body_accelerometer_jerk_z`: Based on `fBodyAccJerk-mean()-Z`.
- 52: `standard_deviation_frequency_body_accelerometer_jerk_x`: Based on `fBodyAccJerk-std()-X`.
- 53: `standard_deviation_frequency_body_accelerometer_jerk_y`: Based on `fBodyAccJerk-std()-Y`.
- 54: `standard_deviation_frequency_body_accelerometer_jerk_z`: Based on `fBodyAccJerk-std()-Z`.
- 55: `mean_frequency_body_gyroscope_x`: Based on `fBodyGyro-mean()-X`.
- 56: `mean_frequency_body_gyroscope_y`: Based on `fBodyGyro-mean()-Y`.
- 57: `mean_frequency_body_gyroscope_z`: Based on `fBodyGyro-mean()-Z`.
- 58: `standard_deviation_frequency_body_gyroscope_x`: Based on `fBodyGyro-std()-X`.
- 59: `standard_deviation_frequency_body_gyroscope_y`: Based on `fBodyGyro-std()-Y`.
- 60: `standard_deviation_frequency_body_gyroscope_z`: Based on `fBodyGyro-std()-Z`.
- 61: `mean_frequency_body_accelerometer_magnitude`: Based on `fBodyAccMag-mean()`.
- 62: `standard_deviation_frequency_body_accelerometer_magnitude`: Based on `fBodyAccMag-std()`.
- 63: `mean_frequency_body_body_accelerometer_jerk_magnitude`: Based on `fBodyBodyAccJerkMag-mean()`.
- 64: `standard_deviation_frequency_body_body_accelerometer_jerk_magnitude`: Based on `fBodyBodyAccJerkMag-std()`.
- 65: `mean_frequency_body_body_gyroscope_magnitude`: Based on `fBodyBodyGyroMag-mean()`.
- 66: `standard_deviation_frequency_body_body_gyroscope_magnitude`: Based on `fBodyBodyGyroMag-std()`.
- 67: `mean_frequency_body_body_gyroscope_jerk_magnitude`: Based on `fBodyBodyGyroJerkMag-mean()`.
- 68: `standard_deviation_frequency_body_body_gyroscope_jerk_magnitude`: Based on `fBodyBodyGyroJerkMag-std()`.


## Features that are not included

Only direct mean and standard deviation variables are included from the raw data.
Examples of features that are not used in the raw data set:

- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-meanFreq()
- angle(tBodyAccMean,gravity)
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)
- angle(Y,gravityMean)
- angle(Z,gravityMean)

The motivation for not including them is that they appear to be _based_ on mean variables but are not primary mean variables themselves.
