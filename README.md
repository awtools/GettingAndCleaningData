# GettingAndCleaningData
# Course Project
This is my solution for the Coursera Course Project of Getting and Cleaning Data

## Files
- codebook.md         Codebook to understand the variables and the steps done to the data in the run_analysis.R Script
- run_analysis.R      the R-Script to get the tidy data from the raw input
- finalData_tidy.txt  Tidy DataSet

## Note
The R-Script run_analysis.R needs the following condition to run. 
- Donwloaded an unziped data into the directory "Getting_and_Cleaning_Data/course_project/UCI HAR Dataset" in your working directory 
- Data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description
R script run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Additional Information
For additional information you can read the coodebook.md
