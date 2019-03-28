# Peer-graded Assignment: Getting and Cleaning Data Course Project
# Author: Abram Beyer
###########################################################################################
###########################################################################################

# Project Requirements:
#  You should create one R script called run_analysis.R that does the following.

#  Merges the training and the test sets to create one data set.
#  Extracts only the measurements on the mean and standard deviation for each measurement.
#  Uses descriptive activity names to name the activities in the data set
#  Appropriately labels the data set with descriptive variable names.
#  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# work inspired by bgentry/coursera-getting-and-cleaning-data-project repo

###########################################################################################

# Header: start every project like this...#

# check if packages are installed.  If not, install them.
list.of.packages <- c("purrr","here","tidyverse","readr","reshape","reshape2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(purrr)
library(here)
library(tidyverse)
library(readr)
library(reshape)
library(reshape2)

# Create project folder structure if it does not exist
folder_names <- c("data",  here::here("data/raw"), here::here("data/tidy"), "refs", "R", "analysis", "figures", "man")
# sapply(folder_names, dir.create)  # base R way
if(!file.exists('./data') & !file.exists('./refs')){
  map(folder_names, dir.create) # purrr-fect way
}

###########################################################################################


# Save project data url in a variable
data_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

# Download zipped file from the project url 
# method = wininet because I am using a windows machine.  If you are using Mac, try method = 'curl'
download.file(data_url, destfile = './data/raw/projectfiles_uci_har_datasets.zip',method='wininet')

###########################################################################################

# Unzip the UCI data folder

zipFile<- "./data/raw/projectfiles_uci_har_datasets.zip"
outDir<-"./data/raw/projectfiles_uci_har_datasets"
unzip(zipFile,exdir=outDir)

###########################################################################################

# Read in the training dataset
x_train <- read.table('./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/train/Y_train.txt')
subjects_train <- read.table("./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/train/subject_train.txt")



# Read in the test dataset
x_test <- read.table('./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/test/Y_test.txt')
subjects_test <- read.table("./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/test/subject_test.txt")



###########################################################################################
# load feature vector
features_vector <- read.table('./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/features.txt')
features_vector[,2] <- as.character(features_vector[,2])

# Load activity labels 
activity_labels <- read.table("./data/raw/projectfiles_uci_har_datasets/UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])


###########################################################################################

# only grab mean and standard deviation features from the features vector
mean_std_features <- grep(".*mean.*|.*std.*", features_vector[,2])
mean_std_features.names <- features_vector[mean_std_features,2]
mean_std_features.names = gsub('-mean', 'Mean', mean_std_features.names)
mean_std_features.names = gsub('-std', 'Std', mean_std_features.names)
mean_std_features.names <- gsub('[-()]', '', mean_std_features.names)

###########################################################################################

# Requirement 1:  Merges the training and the test sets to create one data set.

#only use the selected mean and std features found above.  Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
x_train <- x_train[mean_std_features]
# merge all training datasets together to create one train
# in this case the y is the activity
# Requirement 4:  Loads the activity and subject data for each dataset, and merges those columns with the dataset
train_dataset <- cbind(subjects_train, y_train, x_train)

#only use the selected mean and std features found above Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
x_test <- x_test[mean_std_features]
# merge all test datasets together to create one test 
# in this case, the y is the activity
# Requirement 4:  Loads the activity and subject data for each dataset, and merges those columns with the dataset
test_dataset <- cbind(subjects_test, y_test, x_test)


# Requirement 1:
# merge the training and testing datasets
final_dataset <- rbind(train_dataset, test_dataset)

# rename columns Requirement 3:  Uses descriptive activity names to name the activities in the data set
colnames(final_dataset) <- c("subject", "activity", mean_std_features.names)



# turn activities & subjects into factors
final_dataset$activity <- factor(final_dataset$activity, levels = activity_labels[,1], labels = activity_labels[,2])
final_dataset$subject <- as.factor(final_dataset$subject)

# conver to tidy format
final_dataset.melted <- melt(final_dataset, id = c("subject", "activity"))
final_dataset.mean <- dcast(final_dataset.melted, subject + activity ~ variable, mean)

write.table(final_dataset.mean, "./data/tidy/tidy_dataset.txt", row.names = FALSE, quote = FALSE)

