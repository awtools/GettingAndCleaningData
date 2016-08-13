# Codebook for Course Project
# Script: run_Analysis.R
R script run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Pre-Steps
- Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Unzip it to "Getting_and_Cleaning_Data/course_project/UCI HAR Dataset" in your working directory
- load the library plyr into R (install package if the package is not present on your system)

## Raw Data
Training Data
- X_train.txt
- y_train.txt
- subject_train.txt

Test Data
- X_test.txt
- y_test.txt
- subject_test.txt

Others
- features.txt
- activity_labels.txt

# Tidy data
- finalData_tidy.txt

## Variables
 [1] "subjectId"                                                      
 [2] "activityType"                                                   
 [3] "TimeBodyAcceleration.Mean.X"                                    
 [4] "TimeBodyAcceleration.Mean.Y"                                    
 [5] "TimeBodyAcceleration.Mean.Z"                                    
 [6] "TimeBodyAcceleration.StandardDeviation.X"                       
 [7] "TimeBodyAcceleration.StandardDeviation.Y"                       
 [8] "TimeBodyAcceleration.StandardDeviation.Z"                       
 [9] "TimeGravityAcceleration.Mean.X"                                 
[10] "TimeGravityAcceleration.Mean.Y"                                 
[11] "TimeGravityAcceleration.Mean.Z"                                 
[12] "TimeGravityAcceleration.StandardDeviation.X"                    
[13] "TimeGravityAcceleration.StandardDeviation.Y"                    
[14] "TimeGravityAcceleration.StandardDeviation.Z"                    
[15] "TimeBodyAccelerationJerk.Mean.X"                                
[16] "TimeBodyAccelerationJerk.Mean.Y"                                
[17] "TimeBodyAccelerationJerk.Mean.Z"                                
[18] "TimeBodyAccelerationJerk.StandardDeviation.X"                   
[19] "TimeBodyAccelerationJerk.StandardDeviation.Y"                   
[20] "TimeBodyAccelerationJerk.StandardDeviation.Z"                   
[21] "TimeBodyAngularSpeed.Mean.X"                                    
[22] "TimeBodyAngularSpeed.Mean.Y"                                    
[23] "TimeBodyAngularSpeed.Mean.Z"                                    
[24] "TimeBodyAngularSpeed.StandardDeviation.X"                       
[25] "TimeBodyAngularSpeed.StandardDeviation.Y"                       
[26] "TimeBodyAngularSpeed.StandardDeviation.Z"                       
[27] "TimeBodyAngularAcceleration.Mean.X"                             
[28] "TimeBodyAngularAcceleration.Mean.Y"                             
[29] "TimeBodyAngularAcceleration.Mean.Z"                             
[30] "TimeBodyAngularAcceleration.StandardDeviation.X"                
[31] "TimeBodyAngularAcceleration.StandardDeviation.Y"                
[32] "TimeBodyAngularAcceleration.StandardDeviation.Z"                
[33] "TimeBodyAccelerationMagnitude.Mean"                             
[34] "TimeBodyAccelerationMagnitude.StandardDeviation"                
[35] "TimeGravityAccelerationMagnitude.Mean"                          
[36] "TimeGravityAccelerationMagnitude.StandardDeviation"             
[37] "TimeBodyAccelerationJerkMagnitude.Mean"                         
[38] "TimeBodyAccelerationJerkMagnitude.StandardDeviation"            
[39] "TimeBodyAngularSpeedMagnitude.Mean"                             
[40] "TimeBodyAngularSpeedMagnitude.StandardDeviation"                
[41] "TimeBodyAngularAccelerationMagnitude.Mean"                      
[42] "TimeBodyAngularAccelerationMagnitude.StandardDeviation"         
[43] "FrequencyBodyAcceleration.Mean.X"                               
[44] "FrequencyBodyAcceleration.Mean.Y"                               
[45] "FrequencyBodyAcceleration.Mean.Z"                               
[46] "FrequencyBodyAcceleration.StandardDeviation.X"                  
[47] "FrequencyBodyAcceleration.StandardDeviation.Y"                  
[48] "FrequencyBodyAcceleration.StandardDeviation.Z"                  
[49] "FrequencyBodyAcceleration.MeanFrequency.X"                      
[50] "FrequencyBodyAcceleration.MeanFrequency.Y"                      
[51] "FrequencyBodyAcceleration.MeanFrequency.Z"                      
[52] "FrequencyBodyAccelerationJerk.Mean.X"                           
[53] "FrequencyBodyAccelerationJerk.Mean.Y"                           
[54] "FrequencyBodyAccelerationJerk.Mean.Z"                           
[55] "FrequencyBodyAccelerationJerk.StandardDeviation.X"              
[56] "FrequencyBodyAccelerationJerk.StandardDeviation.Y"              
[57] "FrequencyBodyAccelerationJerk.StandardDeviation.Z"              
[58] "FrequencyBodyAccelerationJerk.MeanFrequency.X"                  
[59] "FrequencyBodyAccelerationJerk.MeanFrequency.Y"                  
[60] "FrequencyBodyAccelerationJerk.MeanFrequency.Z"                  
[61] "FrequencyBodyAngularSpeed.Mean.X"                               
[62] "FrequencyBodyAngularSpeed.Mean.Y"                               
[63] "FrequencyBodyAngularSpeed.Mean.Z"                               
[64] "FrequencyBodyAngularSpeed.StandardDeviation.X"                  
[65] "FrequencyBodyAngularSpeed.StandardDeviation.Y"                  
[66] "FrequencyBodyAngularSpeed.StandardDeviation.Z"                  
[67] "FrequencyBodyAngularSpeed.MeanFrequency.X"                      
[68] "FrequencyBodyAngularSpeed.MeanFrequency.Y"                      
[69] "FrequencyBodyAngularSpeed.MeanFrequency.Z"                      
[70] "FrequencyBodyAccelerationMagnitude.Mean"                        
[71] "FrequencyBodyAccelerationMagnitude.StandardDeviation"           
[72] "FrequencyBodyAccelerationMagnitude.MeanFrequency"               
[73] "FrequencyBodyBodyAccelerationJerkMagnitude.Mean"                
[74] "FrequencyBodyBodyAccelerationJerkMagnitude.StandardDeviation"   
[75] "FrequencyBodyBodyAccelerationJerkMagnitude.MeanFrequency"       
[76] "FrequencyBodyBodyAngularSpeedMagnitude.Mean"                    
[77] "FrequencyBodyBodyAngularSpeedMagnitude.StandardDeviation"       
[78] "FrequencyBodyBodyAngularSpeedMagnitude.MeanFrequency"           
[79] "FrequencyBodyBodyAngularAccelerationMagnitude.Mean"             
[80] "FrequencyBodyBodyAngularAccelerationMagnitude.StandardDeviation"
[81] "FrequencyBodyBodyAngularAccelerationMagnitude.MeanFrequency"

# Steps to reproduce the way from raw to tidy data set
## Step 1: Read in all the Data into R memory
Read all the raw text files into seperate variables

## Step 2: Update the Columnnames 
Update the columnnames with the features.txt file and own names for activity and subject to make it easier to merge and to identify the mean and std values 

## Step 3: Merges the training and the test sets to create one data set.
Merge X_train.txt, y_train.txt and subject_train.txt with cbind to get one dataset for the training data
Merge X_test.txt, y_test.txt and subject_test.txt with cbind to get one dataset for the test data
Merge the two new datasets with rbind to combine them into one dataset you need for the analysis

## Step 4: Extracts only the measurements on the mean and standard deviation for each measurement.
Select (with grepl) only the columns with mean or standard deviation + activityId and subjectId for merging data sets later on

## Step 5: Uses descriptive activity names to name the activities in the data set
Join the data set with the activiy labels to get descriptive names for the activitiyId. After tha remove the Id activitiyId column.

## Step 6:. Appropriately labels the data set with descriptive names.
Make the Columnnames more readable (with gsub)

## Step 7: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Use the ddply funktion from the plyr library to creat a new data set

## Step 8: Write out the tidy data set
Write the tidy data set into the finalData_tidy.txt file


