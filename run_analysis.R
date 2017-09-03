
##Create new data folder, download assignment data and extract files to the relevant directory:

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Data.zip")
unzip(zipfile="./data/Data.zip",exdir="./data")

##Read all relevant data tables:
activity_test  <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity_train  <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Bind train & test data tables (on subject, feature and activities)
## and set the corresponding variable names for each data table;

activity_all <- rbind(activity_train, activity_test)
names(activity_all) <- c("activity_num")

subject_all <- rbind(subject_train, subject_test)
names(subject_all) <- c("subject")

feature_all <- rbind(x_train, x_test)
feature_names <- read.table("./data/UCI HAR Dataset/features.txt", head=FALSE)
names(feature_all) <- feature_names[,2]

## Bind by column to create the complete merged data table;

data_full <- cbind(feature_all, subject_all, activity_all)

## Create a character vector of only the variables of interest (mean and std measurements) 

vec_feature_names <- feature_names[,2]
mean_std_names <- vec_feature_names[grep("mean\\(\\)|std\\(\\)", vec_feature_names)]
selected_variables<-c(as.character(mean_std_names),"subject","activity_num" )

## Extracts only the measurements on the mean and standard deviation for each measurement.

data_full_subset <- subset(data_full, select = selected_variables)

## Use descriptive activity names to name the activities in the data set

activity_names <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names = c("activity_num","activity"))
data_merged <- merge(data_full_subset, activity_names, by.x = "activity_num", by.y = "activity_num")
data_merged <- data_merged[,-1]


## Appropriately label the data set with descriptive variable names

## Replace suffixes f and t with frequency and time
names(data_merged)<-gsub("^t", "time", names(data_merged))
names(data_merged)<-gsub("^f", "frequency", names(data_merged))

## Replace features portions from abbreviations to complete words (also fix typo BodyBody)
names(data_merged)<-gsub("Acc", "Accelerometer", names(data_merged))
names(data_merged)<-gsub("Gyro", "Gyroscope", names(data_merged))
names(data_merged)<-gsub("Mag", "Magnitude", names(data_merged))
names(data_merged)<-gsub("BodyBody", "Body", names(data_merged))

## Remove parentheses from column names 
names(data_merged)<-gsub("[\\(\\)-]", "", names(data_merged))

## Create a second, independent tidy data set with the average of each variable for each activity and each subject:

library(dplyr)
data_tidy <- aggregate(. ~subject + activity, data_merged, mean)
data_tidy <- data_tidy[order(data_tidy$subject,data_tidy$activity),]
write.table(data_tidy, file = "tidydata.txt", row.name = FALSE)
