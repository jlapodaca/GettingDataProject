GettingDataProject
==================

Project work for the Coursera Getting Data course
Script can be found in run_analysis.R

##Data
Original data can be found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
This script assumes the relevant data has already been added to the working directory, sampe place where the
script should be saved in order to work.
Anyhow, the script necessary to download and unzip the relevant files can also be found in run_analysis.R
in lines 5 to 7, but this section was included as a comment. After this, you should save in the working directory the
following files:
X_train.txt
X_test.txt
features.txt
subject_train.txt
y_train.txt
subject_test.txt
y_test.txt
activity_labels.txt

## Script
Script does the following:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. To do this, the script
selects only those columns whose names include the string "mean(" or "std(". 
Adds  descriptive activity names to name the activities in the data set, instead of the original 1 to 6 codes.
Appropriately labels the data set with descriptive variable names, instead of the original V1,V2,... column names
in the data.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject, that is
for each combination of Activity. The resulting dataset is tidy since 

Finally, the script transforms the dataset to a tidy dataset describing the mean of the observations of each of the
variables for each combination of Activity and Subject (180 combinations). 

Data is tidy since every column has a human readable name, every measure is in one variable (column) so subject is 
in one column, activity in another, and means of std and mean variables are in others, and
each different combination of Activity and Subject is in one single row.
