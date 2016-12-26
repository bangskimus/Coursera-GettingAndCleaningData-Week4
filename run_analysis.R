# R Script to Tidy up the various data sets and assemble them into one easy 
#   to understand data table. 

library(dplyr)
library(tidyr)
library(magrittr)

# Set the current working directory
# setwd("/blah/blah")

tidyData <- function ()
{
  # 1. Download the zipped data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  targetFileName <- "UC CHAR Dataset.zip"

  ## Download only if the zip file hasn't been dowloaded yet.
  if (!file.exists((targetFileName))) {
    download.file(url, targetFileName)  
  }

  ## Unzip the files if they haven't been extracted
  unzipFolderName <- "UCI HAR Dataset"
  if (!dir.exists(unzipFolderName)) {
    unzip(targetFileName)
  }

  # 2. Load the dimensions activity label and features.  .  
  ## Load the activity label table
  activityLabelFilePath <- "UCI HAR Dataset/activity_labels.txt"
  if (!file.exists(activityLabelFilePath)) {
    message <- sprintf("%s is not found. Aborting.", activityLabelFilePath)
    stop(message)
  } else {
    activityLabel <- read.table(activityLabelFilePath, header=FALSE, col.names = c("activity_id", "activity_name"))
  }
  
  ## Load the features table
  featureFilePath <- "UCI HAR Dataset/features.txt"
  if (!file.exists(featureFilePath)) {
    message <- sprintf("%s is not found. Aborting.", featureFilePath)
    stop(message)
  } else {
    feature <- read.table(featureFilePath, header=FALSE, col.names = c("feature_id", "feature_name"))
  }

  # 3. Load the training data.
  #    Assumptions:
  #    a. X_train.txt, subject_train.txt and y_train.txt all have the same number of rows and the row numbers
  #       correspond to each other.
  #    b. Columns in X_train.txt correspond to the rows in the features.txt file: 
  #       i.e., the first row in features.txt is the name of the column (variable) of the first column
  #       in X_train.txt
  #    c. Y_train.txt is the activity being performed.
  #    d. subject_train.txt is the person doing the activity.
  
  ## Load the x training data
  trainXDataFilePath <- "UCI HAR Dataset/train/X_train.txt"
  if (!file.exists(trainXDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", trainXDataFilePath)
    stop(message)
  } else {
    trainXData <- read.table(trainXDataFilePath, header=FALSE, col.names = feature[,"feature_name"])
  }
  
  ## Load the subject training data.  
  trainSubjectDataFilePath <- "UCI HAR Dataset/train/subject_train.txt"
  if (!file.exists(trainSubjectDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", trainSubjectDataFilePath)
    stop(message)
  } else {
    trainSubjectData <- read.table(trainSubjectDataFilePath, header=FALSE, col.names = c("subject_id"))
  }
  
  ## Load the activity y training data.
  trainActivityDataFilePath <- "UCI HAR Dataset/train/y_train.txt"
  if (!file.exists(trainSubjectDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", trainSubjectDataFilePath)
    stop(message)
  } else {
    trainActivityData <- read.table(trainActivityDataFilePath, header=FALSE, col.names = c("activity_id"))
  }  
  
  ## Merge all three data frames into one.
  trainData <- cbind(trainSubjectData, trainActivityData, trainXData)
  
  # 3. Load the test data and assign column names.
  #    Assumptions:
  #    a. X_test.txt, subject_test.txt and y_test.txt all have the same number of rows and the row numbers
  #       correspond to each other.
  #    b. Columns in X_test.txt correspond to the rows in the features.txt file: 
  #       i.e., the first row in features.txt is the name of the column (variable) of the first column
  #       in X_test.txt
  #    c. Y_test.txt is the activity being performed.
  #    d. subject_test.txt is the person doing the activity.
  
  ## Load the x test data
  testXDataFilePath <- "UCI HAR Dataset/test/X_test.txt"
  if (!file.exists(testXDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", testXDataFilePath)
    stop(message)
  } else {
    testXData <- read.table(testXDataFilePath, header=FALSE, col.names = feature[,"feature_name"])
  }
  
  ## Load the subject test data.  
  testSubjectDataFilePath <- "UCI HAR Dataset/test/subject_test.txt"
  if (!file.exists(testSubjectDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", testSubjectDataFilePath)
    stop(message)
  } else {
    testSubjectData <- read.table(testSubjectDataFilePath, header=FALSE, col.names = c("subject_id"))
  }
  
  ## Load the activity y test data.
  testActivityDataFilePath <- "UCI HAR Dataset/test/y_test.txt"
  if (!file.exists(trainSubjectDataFilePath)) {
    message <- sprintf("%s is not found. Aborting.", testActivityDataFilePath)
    stop(message)
  } else {
    testActivityData <- read.table(testActivityDataFilePath, header=FALSE, col.names = c("activity_id"))
  }  
  
  ## Merge all three data frames into one.
  testData <- cbind(testSubjectData, testActivityData, testXData)
  
  # 4. Merge the training and test data frames.
  trainAndTestData <- rbind(trainData, testData)
  
  # 5. Remove columns that are not mean, std, subject_id and activity_id
  #    Mixed cases are used for "mean" and "std". Ignore the case when using grep or grepl
  columnNames <- colnames(trainAndTestData)
  featureMeanStd <-  grepl("mean|std|subject_id|activity_id", columnNames, ignore.case = TRUE)
  meanAndStdData <- trainAndTestData[,featureMeanStd == TRUE]
  
  # 6. Clean the column names
  columnName <- colnames(meanAndStdData)
  cleanColumnName <- columnName %>% 
                      gsub(pattern="mean", replacement="Mean") %>%
                      gsub(pattern="std", replacement="Std") %>%
                      gsub(pattern="gravity", replacement="Gravity") %>%
                      gsub(pattern="\\.", replacement="")
  colnames(meanAndStdData) <- cleanColumnName
  
  # 7. Add the descriptive activity name to the train and test data frame.
  meanAndStdDataWithActivityName <- merge(activityLabel, meanAndStdData, by="activity_id")
  
  # 8. Save the data frame to a file.
  write.table(meanAndStdDataWithActivityName, "tidy_mean_and_std.txt")

  # 9. Get the average for the mean and std columns aggregating on subject_id and activity_id.
  avgMeanAndStd <- aggregate(. ~subject_id + activity_id + activity_name, meanAndStdDataWithActivityName, FUN=mean)
  
  # 10. Save the average mean and std by subject and activity to a file
  write.table(avgMeanAndStd, "tidy_average_mean_and_std.txt")
}

tidyData()
