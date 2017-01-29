library(dplyr)

writeIntermediateFiles <- FALSE

# Run Analysis

# This Script does the following tasks:

# Using the training and test sets provided at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1- Merges the training and the test sets to create one data set. 
# 2- Extracts only the measurements on the mean and standard deviation for each measurement.
# 3- Uses descriptive activity names to name the activities in the data set
# 4- Appropriately labels the data set with descriptive variable names.
# 5- From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

# Preparation steps:
# Reads all the files into dataframes.
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
test_subject <- read.table("subject_test.txt")
test_observations <- read.table("X_test.txt")
test_activities <- read.table("Y_test.txt")
train_observations <- read.table("X_train.txt")
train_subject <- read.table("subject_train.txt")
train_activities <- read.table("y_train.txt")

# Step 1: Merge the training and tests data sets
allObservations <- rbind(train_observations, test_observations)
if (writeIntermediateFiles) {
	write.csv(allObservations, "step1.csv")
}

# 2- Extracts only the measurements on the mean and standard deviation 
# for each measurement.
names(allObservations) <- features[,2]
allObservations <- allObservations[,grepl("(mean\\(\\)|-std\\(\\))", colnames(allObservations))]
if (writeIntermediateFiles) {
	write.csv(allObservations, "step2.csv")
}

# 3- Uses descriptive activity names to name the activities in the data set
allsubjects = rbind(train_subject, test_subject)
allObservations$observation_subjects <- allsubjects$V1

allactivities = rbind(train_activities, test_activities)
allObservations$activities <- allactivities$V1

allObservations <- merge(allObservations, activity_labels, by.x = "activities", by.y = "V1")
allObservations <- rename(allObservations, activity_name= V2)
if (writeIntermediateFiles) {
	write.csv(allObservations, "step3.csv")
}

# 4 - Appropriately labels the data set with descriptive variable names.
# Renames the variables with relevant names - Requirement 4
varNames <- names(allObservations)
varNames <- gsub("^t", "time-", varNames)
varNames <- gsub("^f", "frequency-", varNames)
varNames <- gsub("Acc", "Accelerometer", varNames)
varNames <- gsub("Gyro", "Gyroscope", varNames)
varNames <- gsub("Mag", "Magnitude", varNames)
varNames <- gsub("Jerk", "JerkSignals", varNames)
varNames <- gsub("-std\\(\\)", "_StandardDeviation", varNames)
varNames <- gsub("-mean\\(\\)", "_Mean", varNames)
varNames <- gsub("-", "_", varNames)
names(allObservations) <- varNames
if (writeIntermediateFiles) {
	write.csv(allObservations, "step4.csv")
}

# 5- From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.
activity_subject <-group_by(activity_subject, activity_name, observation_subjects)
tidy_dataset <- summarize(
	activity_subject, 
	mean_time_BodyAccelerometer_Mean_X = mean(time_BodyAccelerometer_Mean_X),
	mean_time_BodyAccelerometer_Mean_Y =  mean(time_BodyAccelerometer_Mean_Y),
	mean_time_BodyAccelerometer_Mean_Z =  mean(time_BodyAccelerometer_Mean_Z),
	mean_time_BodyAccelerometer_StandardDeviation_X =  mean(time_BodyAccelerometer_StandardDeviation_X),
	mean_time_BodyAccelerometer_StandardDeviation_Y =  mean(time_BodyAccelerometer_StandardDeviation_Y),
	mean_time_BodyAccelerometer_StandardDeviation_Z =  mean(time_BodyAccelerometer_StandardDeviation_Z),
	mean_time_GravityAccelerometer_Mean_X =  mean(time_GravityAccelerometer_Mean_X),
	mean_time_GravityAccelerometer_Mean_Y =  mean(time_GravityAccelerometer_Mean_Y),
	mean_time_GravityAccelerometer_Mean_Z =  mean(time_GravityAccelerometer_Mean_Z),
	mean_time_GravityAccelerometer_StandardDeviation_X =  mean(time_GravityAccelerometer_StandardDeviation_X),
	mean_time_GravityAccelerometer_StandardDeviation_Y =  mean(time_GravityAccelerometer_StandardDeviation_Y),
	mean_time_GravityAccelerometer_StandardDeviation_Z =  mean(time_GravityAccelerometer_StandardDeviation_Z),
	mean_time_BodyAccelerometerJerkSignals_Mean_X =  mean(time_BodyAccelerometerJerkSignals_Mean_X),
	mean_time_BodyAccelerometerJerkSignals_Mean_Y =  mean(time_BodyAccelerometerJerkSignals_Mean_Y),
	mean_time_BodyAccelerometerJerkSignals_Mean_Z =  mean(time_BodyAccelerometerJerkSignals_Mean_Z),
	mean_time_BodyAccelerometerJerkSignals_StandardDeviation_X =  mean(time_BodyAccelerometerJerkSignals_StandardDeviation_X),
	mean_time_BodyAccelerometerJerkSignals_StandardDeviation_Y =  mean(time_BodyAccelerometerJerkSignals_StandardDeviation_Y),
	mean_time_BodyAccelerometerJerkSignals_StandardDeviation_Z =  mean(time_BodyAccelerometerJerkSignals_StandardDeviation_Z),
	mean_time_BodyGyroscope_Mean_X =  mean(time_BodyGyroscope_Mean_X),
	mean_time_BodyGyroscope_Mean_Y =  mean(time_BodyGyroscope_Mean_Y),
	mean_time_BodyGyroscope_Mean_Z =  mean(time_BodyGyroscope_Mean_Z),
	mean_time_BodyGyroscope_StandardDeviation_X =  mean(time_BodyGyroscope_StandardDeviation_X),
	mean_time_BodyGyroscope_StandardDeviation_Y =  mean(time_BodyGyroscope_StandardDeviation_Y),
	mean_time_BodyGyroscope_StandardDeviation_Z =  mean(time_BodyGyroscope_StandardDeviation_Z),
	mean_time_BodyGyroscopeJerkSignals_Mean_X =  mean(time_BodyGyroscopeJerkSignals_Mean_X),
	mean_time_BodyGyroscopeJerkSignals_Mean_Y =  mean(time_BodyGyroscopeJerkSignals_Mean_Y),
	mean_time_BodyGyroscopeJerkSignals_Mean_Z =  mean(time_BodyGyroscopeJerkSignals_Mean_Z),
	mean_time_BodyGyroscopeJerkSignals_StandardDeviation_X =  mean(time_BodyGyroscopeJerkSignals_StandardDeviation_X),
	mean_time_BodyGyroscopeJerkSignals_StandardDeviation_Y =  mean(time_BodyGyroscopeJerkSignals_StandardDeviation_Y),
	mean_time_BodyGyroscopeJerkSignals_StandardDeviation_Z =  mean(time_BodyGyroscopeJerkSignals_StandardDeviation_Z),
	mean_time_BodyAccelerometerMagnitude_Mean =  mean(time_BodyAccelerometerMagnitude_Mean),
	mean_time_BodyAccelerometerMagnitude_StandardDeviation =  mean(time_BodyAccelerometerMagnitude_StandardDeviation),
	mean_time_GravityAccelerometerMagnitude_Mean =  mean(time_GravityAccelerometerMagnitude_Mean),
	mean_time_GravityAccelerometerMagnitude_StandardDeviation =  mean(time_GravityAccelerometerMagnitude_StandardDeviation),
	mean_time_BodyAccelerometerJerkSignalsMagnitude_Mean =  mean(time_BodyAccelerometerJerkSignalsMagnitude_Mean),
	mean_time_BodyAccelerometerJerkSignalsMagnitude_StandardDeviation =  mean(time_BodyAccelerometerJerkSignalsMagnitude_StandardDeviation),
	mean_time_BodyGyroscopeMagnitude_Mean =  mean(time_BodyGyroscopeMagnitude_Mean),
	mean_time_BodyGyroscopeMagnitude_StandardDeviation =  mean(time_BodyGyroscopeMagnitude_StandardDeviation),
	mean_time_BodyGyroscopeJerkSignalsMagnitude_Mean =  mean(time_BodyGyroscopeJerkSignalsMagnitude_Mean),
	mean_time_BodyGyroscopeJerkSignalsMagnitude_StandardDeviation =  mean(time_BodyGyroscopeJerkSignalsMagnitude_StandardDeviation),
	mean_frequency_BodyAccelerometer_Mean_X =  mean(frequency_BodyAccelerometer_Mean_X),
	mean_frequency_BodyAccelerometer_Mean_Y =  mean(frequency_BodyAccelerometer_Mean_Y),
	mean_frequency_BodyAccelerometer_Mean_Z =  mean(frequency_BodyAccelerometer_Mean_Z),
	mean_frequency_BodyAccelerometer_StandardDeviation_X =  mean(frequency_BodyAccelerometer_StandardDeviation_X),
	mean_frequency_BodyAccelerometer_StandardDeviation_Y =  mean(frequency_BodyAccelerometer_StandardDeviation_Y),
	mean_frequency_BodyAccelerometer_StandardDeviation_Z =  mean(frequency_BodyAccelerometer_StandardDeviation_Z),
	mean_frequency_BodyAccelerometerJerkSignals_Mean_X =  mean(frequency_BodyAccelerometerJerkSignals_Mean_X),
	mean_frequency_BodyAccelerometerJerkSignals_Mean_Y =  mean(frequency_BodyAccelerometerJerkSignals_Mean_Y),
	mean_frequency_BodyAccelerometerJerkSignals_Mean_Z =  mean(frequency_BodyAccelerometerJerkSignals_Mean_Z),
	mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_X =  mean(frequency_BodyAccelerometerJerkSignals_StandardDeviation_X),
	mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_Y =  mean(frequency_BodyAccelerometerJerkSignals_StandardDeviation_Y),
	mean_frequency_BodyAccelerometerJerkSignals_StandardDeviation_Z =  mean(frequency_BodyAccelerometerJerkSignals_StandardDeviation_Z),
	mean_frequency_BodyGyroscope_Mean_X =  mean(frequency_BodyGyroscope_Mean_X),
	mean_frequency_BodyGyroscope_Mean_Y =  mean(frequency_BodyGyroscope_Mean_Y),
	mean_frequency_BodyGyroscope_Mean_Z =  mean(frequency_BodyGyroscope_Mean_Z),
	mean_frequency_BodyGyroscope_StandardDeviation_X =  mean(frequency_BodyGyroscope_StandardDeviation_X),
	mean_frequency_BodyGyroscope_StandardDeviation_Y =  mean(frequency_BodyGyroscope_StandardDeviation_Y),
	mean_frequency_BodyGyroscope_StandardDeviation_Z =  mean(frequency_BodyGyroscope_StandardDeviation_Z),
	mean_frequency_BodyAccelerometerMagnitude_Mean =  mean(frequency_BodyAccelerometerMagnitude_Mean),
	mean_frequency_BodyAccelerometerMagnitude_StandardDeviation =  mean(frequency_BodyAccelerometerMagnitude_StandardDeviation),
	mean_frequency_BodyBodyAccelerometerJerkSignalsMagnitude_Mean =  mean(frequency_BodyBodyAccelerometerJerkSignalsMagnitude_Mean),
	mean_frequency_BodyBodyAccelerometerJerkSignalsMagnitude_StandardDeviation =  mean(frequency_BodyBodyAccelerometerJerkSignalsMagnitude_StandardDeviation),
	mean_frequency_BodyBodyGyroscopeMagnitude_Mean =  mean(frequency_BodyBodyGyroscopeMagnitude_Mean),
	mean_frequency_BodyBodyGyroscopeMagnitude_StandardDeviation =  mean(frequency_BodyBodyGyroscopeMagnitude_StandardDeviation),
	mean_frequency_BodyBodyGyroscopeJerkSignalsMagnitude_Mean =  mean(frequency_BodyBodyGyroscopeJerkSignalsMagnitude_Mean),
	mean_frequency_BodyBodyGyroscopeJerkSignalsMagnitude_StandardDeviation =  mean(frequency_BodyBodyGyroscopeJerkSignalsMagnitude_StandardDeviation)
)
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)