library(plyr)

# Directories and files
uci_hard_dir <- "Getting_and_Cleaning_Data/course_project/UCI HAR Dataset/"

x_train <- read.table(paste(uci_hard_dir,"train/X_train.txt", sep = ""))
y_train <- read.table(paste(uci_hard_dir,"train/y_train.txt", sep = ""))
subject_train <- read.table(paste(uci_hard_dir,"train/subject_train.txt", sep = ""))

x_test <- read.table(paste(uci_hard_dir,"test/X_test.txt", sep = ""))
y_test <- read.table(paste(uci_hard_dir,"test/y_test.txt", sep = ""))
subject_test <- read.table(paste(uci_hard_dir,"test/subject_test.txt", sep = ""))

features <- read.table(paste(uci_hard_dir, "features.txt", sep = ""))
activity_labels <- read.table(paste(uci_hard_dir, "activity_labels.txt", sep = ""))

# Names (also to make it easier for joining, merging)
colnames(activity_labels) = c('activityId','activityType')
colnames(subject_train)  = "subjectId"
colnames(x_train)        = features[,2] 
colnames(y_train)        = "activityId"
colnames(subject_test) = "subjectId"
colnames(x_test)       = features[,2] 
colnames(y_test)       = "activityId"

# 1. Merges the training and the test sets to create one data set.
##################################################################

trainingData = cbind(y_train,subject_train,x_train)

testData = cbind(y_test,subject_test,x_test)

finalData = rbind(trainingData,testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

finalData_mean_std <- finalData[,grepl("mean|std|subjectId|activityId", names(finalData))]

# 3. Uses descriptive activity names to name the activities in the data set
###########################################################################

finalData_mean_std <- join(finalData_mean_std, activity_labels, by = "activityId", match = "first") # add name of activity to dataset
finalData_mean_std <- finalData_mean_std[,-1] # remove the activityId column


# 4. Appropriately labels the data set with descriptive names.
##############################################################
# Remove ()
names(finalData_mean_std) <- gsub('\\(|\\)',"",names(finalData_mean_std), perl = TRUE)
# Make syntactically valid names
names(finalData_mean_std) <- make.names(names(finalData_mean_std))
# Make names readable
names(finalData_mean_std) <- gsub('Acc',"Acceleration",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Gyro',"AngularSpeed",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Mag',"Magnitude",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('^t',"Time",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('^f',"Frequency",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('\\.mean',".Mean",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('\\.std',".StandardDeviation",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Freq\\.',"Frequency.",names(finalData_mean_std))
names(finalData_mean_std) <- gsub('Freq$',"Frequency",names(finalData_mean_std))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################

finalData_tidy = ddply(finalData_mean_std, c("subjectId","activityType"), numcolwise(mean))
write.table(finalData_tidy, file = paste0(uci_hard_dir,"finalData_tidy.txt"))
