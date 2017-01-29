---
title: "CodeBook"
output: html_document
---

## Code Book Introduction

This codebook file describes the data set provided to summarize the measurements captured under the experiments of the accelerometer and gyroscope instruments using a Samsung Galaxy S type of device, on 6 different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

### Source data & data Reading 

The input for these data sets are the training and test sets provided at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For which the following files are read:

* features.txt : data set variable names (561)
* activity_labels.txt: a correlation betwee the activity ID (number) and the activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject_test.txt: For the test dataset, an ordered list of subjects for each measurement (row).
* X_test.txt: All test dataset measurements.
* Y_test.txt: For the test dataset, the activity number for the measurements.
* subject_train.txt: For the train dataset, an ordered list of subjects for each measurement (row).
* X_train.txt: All train dataset measurements.
* y_train.txt: For the train test dataset, the activity number for the measurements.

## Data Processing:

To process this datases, a [r] script was developed, note that some of the processing steps described might refer to [r] programming language including data types, functions and structures such as read.table (function) and data frames (data type).

The following Steps were done as part of the data processing:

### Processing Step 1: Merges the training and the test sets to create one data set. 

After data is read into variables using the read.table command, both the main train and test observation tables read from X_test.txt and Y_text.txt are merged into one single data frame.

### Processing Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

After the data is merged, the script sets the names of the variables in the same way as contained in the features.txt data file, for example: tBodyAcc-std()-X, tGravityAcc-mad()-X or tBodyGyroJerk-min()-Z.

The script then selects only those variables related to the mean and standard deviation for a measurement, removing all the variables that don't contain such naming convention.

This is done by selecting only those variables where the actual measurement describes the operation by having the subtext: "mean()" or "std()".

### Processing Step 3: Uses descriptive activity names to name the activities in the data set

The script appends a new column to the data frame containing the consolidated list of "activities". This column contains a numeric value that represents the activity under which the measurement was taken.

Once this is done, the main data frame is merged with the data frame that contains the activity labels ready from activity_labels.txt. 

This results in an additional column called "activity_name" which describes the type of activity for each measurement.

### 4- Appropriately labels the data set with descriptive variable names.

By expanding abbreviations, and improving the naming conventions, each variable is renamed to make the data set more readable, and easier to understand.

### 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally, the set is grouped using both the subject who was performing the experiment, and the type of activity the he/she was performing for the experiments, and the average of all variables were computed and stored in a new data frame.

## Variables

The following variables are included in the resulting data set:

* factor(groupingVariable): 
Each variable of this data set is averaged over each groups of "subjects" and "activities". Each of these variables are the mean over such groups.
This column, represent each of these groups, where the id is a combination of Activity and Suject.
* mean_time_BodyAccelerometer_Mean_X: Mean of measurements on X axis, of the time based BodyAccelerometer signals.
* mean_time_BodyAccelerometer_Mean_Y: Mean of measurements on Y axis, of the time based BodyAccelerometer signals.
* mean_time_BodyAccelerometer_Mean_Z: Mean of measurements on Z axis, of the time based BodyAccelerometer signals.
* mean_time_BodyAccelerometer_StandardDeviation_X: StandardDeviation of measurements on X axis, of the time based BodyAccelerometer signals.
* mean_time_BodyAccelerometer_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the time based BodyAccelerometer signals.
* mean_time_BodyAccelerometer_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the time based BodyAccelerometer signals.
* mean_time_GravityAccelerometer_Mean_X: Mean of measurements on X axis, of the time based GravityAccelerometer signals.
* mean_time_GravityAccelerometer_Mean_Y: Mean of measurements on Y axis, of the time based GravityAccelerometer signals.
* mean_time_GravityAccelerometer_Mean_Z: Mean of measurements on Z axis, of the time based GravityAccelerometer signals.
* mean_time_GravityAccelerometer_StandardDeviation_X: StandardDeviation of measurements on X axis, of the time based GravityAccelerometer signals.
* mean_time_GravityAccelerometer_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the time based GravityAccelerometer signals.
* mean_time_GravityAccelerometer_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the time based GravityAccelerometer signals.
* mean_time_BodyAccelerometerJerkSignals_Mean_X: Mean of measurements on X axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyAccelerometerJerkSignals_Mean_Y: Mean of measurements on Y axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyAccelerometerJerkSignals_Mean_Z: Mean of measurements on Z axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyAccelerometerJerkSignals_StandardDeviation_X: StandardDeviation of measurements on X axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyAccelerometerJerkSignals_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyAccelerometerJerkSignals_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the time based BodyAccelerometerJerk signals.
* mean_time_BodyGyroscope_Mean_X: Mean of measurements on X axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscope_Mean_Y: Mean of measurements on Y axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscope_Mean_Z: Mean of measurements on Z axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscope_StandardDeviation_X: StandardDeviation of measurements on X axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscope_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscope_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the time based BodyGyroscope signals.
* mean_time_BodyGyroscopeJerkSignals_Mean_X: Mean of measurements on X axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyGyroscopeJerkSignals_Mean_Y: Mean of measurements on Y axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyGyroscopeJerkSignals_Mean_Z: Mean of measurements on Z axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyGyroscopeJerkSignals_StandardDeviation_X: StandardDeviation of measurements on X axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyGyroscopeJerkSignals_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyGyroscopeJerkSignals_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the time based BodyGyroscopeJerk signals.
* mean_time_BodyAccelerometerMagnitude_Mean: Mean of measurements of the time based BodyAccelerometerMagnitude signals.
* mean_time_BodyAccelerometerMagnitude_StandardDeviation: StandardDeviation of measurements of the time based BodyAccelerometerMagnitude signals.
* mean_time_GravityAccelerometerMagnitude_Mean: Mean of measurements of the time based GravityAccelerometerMagnitude signals.
* mean_time_GravityAccelerometerMagnitude_StandardDeviation: StandardDeviation of measurements of the time based GravityAccelerometerMagnitude signals.
* mean_time_BodyAccelerometerJerkSignalsMagnitude_Mean: Mean of measurements of the time based BodyAccelerometerJerkMagnitude signals.
* mean_time_BodyAccelerometerJerkSignalsMagnitude_StandardDeviation: StandardDeviation of measurements of the time based BodyAccelerometerJerkMagnitude signals.
* mean_time_BodyGyroscopeMagnitude_Mean: Mean of measurements of the time based BodyGyroscopeMagnitude signals.
* mean_time_BodyGyroscopeMagnitude_StandardDeviation: StandardDeviation of measurements of the time based BodyGyroscopeMagnitude signals.
* mean_time_BodyGyroscopeJerkSignalsMagnitude_Mean: Mean of measurements of the time based BodyGyroscopeJerkMagnitude signals.
* mean_time_BodyGyroscopeJerkSignalsMagnitude_StandardDeviation: StandardDeviation of measurements of the time based BodyGyroscopeJerkMagnitude signals.
* mean_frequency_BodyAccelerometer_Mean_X: Mean of measurements on X axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometer_Mean_Y: Mean of measurements on Y axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometer_Mean_Z: Mean of measurements on Z axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometer_StandardDeviation_X: StandardDeviation of measurements on X axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometer_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometer_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the frequency based BodyAccelerometer signals.
* mean_frequency_BodyAccelerometerJerkSignals_Mean_X: Mean of measurements on X axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyAccelerometerJerkSignals_Mean_Y: Mean of measurements on Y axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyAccelerometerJerkSignals_Mean_Z: Mean of measurements on Z axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_X: StandardDeviation of measurements on X axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the frequency based BodyAccelerometerJerk signals.
* mean_frequency_BodyGyroscope_Mean_X: Mean of measurements on X axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyGyroscope_Mean_Y: Mean of measurements on Y axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyGyroscope_Mean_Z: Mean of measurements on Z axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyGyroscope_StandardDeviation_X: StandardDeviation of measurements on X axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyGyroscope_StandardDeviation_Y: StandardDeviation of measurements on Y axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyGyroscope_StandardDeviation_Z: StandardDeviation of measurements on Z axis, of the frequency based BodyGyroscope signals.
* mean_frequency_BodyAccelerometerMagnitude_Mean: Mean of measurements of the frequency based BodyAccelerometerMagnitude signals.
* mean_frequency_BodyAccelerometerMagnitude_StandardDeviation: StandardDeviation of measurements of the frequency based BodyAccelerometerMagnitude signals.
* mean_frequency_BodyBodyAccelerometerJerkSignalsMagnitude_Mean: Mean of measurements of the frequency based BodyBodyAccelerometerJerkMagnitude signals.
* mean_frequency_BodyBodyAccelerometerJerkSignalsMagnitude_StandardDeviation: StandardDeviation of measurements of the frequency based BodyBodyAccelerometerJerkMagnitude signals.
* mean_frequency_BodyBodyGyroscopeMagnitude_Mean: Mean of measurements of the frequency based BodyBodyGyroscopeMagnitude signals.
* mean_frequency_BodyBodyGyroscopeMagnitude_StandardDeviation: StandardDeviation of measurements of the frequency based BodyBodyGyroscopeMagnitude signals.
* mean_frequency_BodyBodyGyroscopeJerkSignalsMagnitude_Mean: Mean of measurements of the frequency based BodyBodyGyroscopeJerkMagnitude signals.
* mean_frequency_BodyBodyGyroscopeJerkSignalsMagnitude_StandardDeviation: StandardDeviation of measurements of the frequency based BodyBodyGyroscopeJerkMagnitude signals.


