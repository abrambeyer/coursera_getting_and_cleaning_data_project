# Coursera Getting and Cleaning Data Final Project Code Book

# This code book explains the final tidy dataset called tidy_dataset.txt.  

The tidy_dataset.txt file can be created by running run_analysis.R and can be found in the ./data/tidy folder


# Dataset Description:

## Dimensions:

There are 180 rows and 81 columns in the tidy_dataset.txt file.

## Column Types:

* subject:  "Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.""
* activity: Label of activity type
* "Mean" columns:  Show the average of each variable for each activity and each subject.

## Variables in the dataset:

tBodyAccMeanX
"tBodyAccMeanY"
"tBodyAccStdY"
"tGravityAccMeanY"
"tGravityAccStdY"
"tBodyAccJerkMeanY"
"tBodyAccJerkStdY"
"tBodyGyroMeanY"
"tBodyGyroStdY"
"tBodyGyroJerkMeanY"
"tBodyGyroJerkStdY"
"tBodyAccMagStd"
"tBodyAccJerkMagMean"
"tBodyGyroMagStd"
"fBodyAccMeanX"
"fBodyAccStdX"
"fBodyAccMeanFreqX"
"fBodyAccJerkMeanX"
"fBodyAccJerkStdX"
"fBodyAccJerkMeanFreqX"
"fBodyGyroMeanX"
"fBodyGyroStdX"
"fBodyGyroMeanFreqX"
"fBodyAccMagMean"
"fBodyBodyAccJerkMagMean"
"fBodyBodyGyroMagMean"
"fBodyBodyGyroJerkMagMean"
"tBodyAccMeanZ"
"tBodyAccStdZ"
"tGravityAccMeanZ"
"tGravityAccStdZ"
"tBodyAccJerkMeanZ"
"tBodyAccJerkStdZ"
"tBodyGyroMeanZ"
"tBodyGyroStdZ"
"tBodyGyroJerkMeanZ"
"tBodyGyroJerkStdZ"
"tGravityAccMagMean"
"tBodyAccJerkMagStd"
"tBodyGyroJerkMagMean"
"fBodyAccMeanY"
"fBodyAccStdY"
"fBodyAccMeanFreqY"
"fBodyAccJerkMeanY"
"fBodyAccJerkStdY"
"fBodyAccJerkMeanFreqY"
"fBodyGyroMeanY"
"fBodyGyroStdY"
"fBodyGyroMeanFreqY"
"fBodyAccMagStd"
"fBodyBodyAccJerkMagStd"
"fBodyBodyGyroMagStd"
"fBodyBodyGyroJerkMagStd"
"tBodyAccStdX"
"tGravityAccMeanX"
"tGravityAccStdX"
"tBodyAccJerkMeanX"
"tBodyAccJerkStdX"
"tBodyGyroMeanX"
"tBodyGyroStdX"
"tBodyGyroJerkMeanX"
"tBodyGyroJerkStdX"
"tBodyAccMagMean"
"tGravityAccMagStd"
"tBodyGyroMagMean"
"tBodyGyroJerkMagStd"
"fBodyAccMeanZ"
"fBodyAccStdZ"
"fBodyAccMeanFreqZ"
"fBodyAccJerkMeanZ"
"fBodyAccJerkStdZ"
"fBodyAccJerkMeanFreqZ"
"fBodyGyroMeanZ"
"fBodyGyroStdZ"
"fBodyGyroMeanFreqZ"
"fBodyAccMagMeanFreq"
"fBodyBodyAccJerkMagMeanFreq"
"fBodyBodyGyroMagMeanFreq"
"fBodyBodyGyroJerkMagMeanFreq"

## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test
