# Coursera - Getting and Cleaning Data - Week 4 Course Assignment

This github repository was created solely for the purpose of completing the Coursera - Getting and Cleaning Data assigmment.

## Assignment Instructions
1. Here are the instructions as outlined in the course assignment:
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files
1. run_analyis.R - R code to perform the assignment.  The R code is encapsulated into a function so we can abort/stop if there are missing files.
2. tidy_average_mean_and_std.txt - output of the tidy data required for step 6 of the instructions.
3. tidy_mean_and_std.txt - not required for the assignment but added just for fun so we can see the tidy data set prior to getting the average of the mean and std values.

## Analysis and Process
The following describes the process and analysis taken to get to step 6 of the instructions.

#### Download the ZIP file.
1.  If the zip file does not exist, download it from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.  If the zip file has not been expanded, unzip it.

#### Load the feature and activity dimensions/reference data.
The features.txt file contains the feature dimension and activity_labels.txt contains the activity dimension.

1.  Load features.txt into a data frame and assign the column names feature_id and feature_name.
2.  Load activity_labels.txt into a data frame and assign the column names activity_id and activity_name.

#### Load and assemble the train data set.
##### Assumptions for the train data set:
- X_train.txt, subject_train.txt and y_train.txt all have the same number of rows and the row numbers correspond to each other.
- Columns in X_train.txt correspond to the rows in the features.txt file: i.e., the first row in features.txt is the name of the column (variable) of the first column in X_train.txt
- Y_train.txt is the activity being performed.
- subject_train.txt is the person doing the activity.

##### Steps to load the train data sets:
1.  Load the x_train.txt into a data frame.  Assign column names using the list from features.txt.
2.  Load the y_train.txt into a data frame.  Assign the column name "activity_id".
3.  Load the subject_train.txt into a data frame.  Assign the column name "subject_d".
4.  Bind all 3 data frames by column.

#### Load and assemble the test data set.
Assumptions for the test data set:
- X_test.txt, subject_test.txt and y_test.txt all have the same number of rows and the row numbers correspond to each other.
- Columns in X_test.txt correspond to the rows in the features.txt file: i.e., the first row in features.txt is the name of the column (variable) of the first column in X_train.txt
- Y_test.txt is the activity being performed.
- subject_test.txt is the person or volunteer doing the activity.

Steps to load the test data sets:
1.  Load the x_test.txt into a data frame.  Assign column names using the list from features.txt.
2.  Load the y_test.txt into a data frame.  Assign the column name "activity_id".
3.  Load the subject_test.txt into a data frame.  Assign the column name "subject_d".
4.  Bind all 3 data frames by column.

#### Merge the train and test data set.

1.  Merge the train and test data frames.  Both data frames should have the same number of columns with the same names.

#### Remove columns that does not have the words mean and std.  Note that column names have mixed cases for mean.

1.  Extract the column names from the merged test and train data frame.
2.  Get a vector where the column names contains the following string while ignoring case: subject_id, activity_id, mean and std.  subject_id and activity_id need to be included else those columns may get dropped.

#### Clean up the column names. When using read.tables, the characters "(", ")" and "-" were replaced with a ".". This made the column names a bit ugly.

1.  For each column name, replace the occurence of the word "mean" with "Mean".
2.  For each column name, replace the occurence of the word "std" with "Std".
3.  For each column name, replace the occurence of the word "gravity" with "Gravity".
4.  For each column name, replace the occurence of "." with "".

#### Give a friendly variable name to the activity_id.

Using merge, merge the merged train and test data frame with the activity label data frame using "activity_id" as the key column.

#### Just for fun, save the train and test data set with the activity name to a file.

Using write.table, save the merged train and test data set with the activity to file "tidy_mean_and_std.txt".

#### Step 6 of assignment instructions, get the average of each variable by each activity and subject.

To get to step 6 of the instructions:
1.  Get the mean of the each feature (mean and std) by aggregating on activity_id, activity_name and subject_id.
2.  Save the tidy result to file "tidy_average_mean_and_std.txt".
 
####   
