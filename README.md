---
title: "README"
output: html_document
---

## Data Cleaning script README file

This document acts as a short introduction of the script developed to prepare a tidy data set for data analysis.

The source of the data is a set of observations coming from an experiment done to measure values from the accelerometer and gyroscope 3-axial raw signals, performed by a group of 30 volunteers, using a Samsung Galaxy S type of device, in 6 different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

## Script description:
The [R] script to prepare the tidy data set consists of the following Steps:

The script is organized in 5 sub - steps, that performs distinct sub-activities.

To illustrate the intermediate results better, a flag called writeIntermediateFiles is included in the 3rd line of the script.

Change this flag to 

```
writeIntermediateFiles <- TRUE
```

in order to tell the script to generate intermediate ".csv" files that represent the state of the data after the finalization of each step. 

This generates files named: step1.csv, step2.csv, step3.csv, step4.csv, which can be read to verify the results of each step.

### Source data & data Reading 
The input for these data sets are the training and test sets provided at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For which the following files are read:

* features.txt
* activity_labels.txt
* subject_test.txt
* X_test.txt
* Y_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt

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

By expanding abbreviations, and improving the naming conventions each variable is renamed to make the data set more readable, and easier to understand.

### 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally, the set is grouped using both the subject who was performing the experiment, and the type of activity the he/she was performing for the experiments, and the average of all variables were computed and stored in a new data frame.

This data frame is generated in a new file called "tidy_dataset.txt".

