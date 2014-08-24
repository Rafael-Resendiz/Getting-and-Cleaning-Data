# Getting and Cleaning Data Project

# Code developed by Rafael Reséndiz Ramirez

	# 1.	Merges the training and the test sets to create one data set.
	
	
	# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
	
	# 3.	Uses descriptive activity names to name the activities in the data set
	
	# 4.	Appropriately labels the data set with descriptive variable names. 
	
	# 5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	
	

## A full description is available at the site where the data was obtained:
## Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Original Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### 1. Step one:
# Download a file from the web
# fileUrl <- "link?accessType=DOWNLOAD"

if(!file.exists(".UCI_HAR_Dataset")){dir.create("./UCI_HAR_Dataset")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"

# download.file(fileUrl, destfile = "directorio/nombre_archivo.csv", method = "curl")

download.file(fileUrl, destfile = "/Users/administrador/Specialization/UCI_HAR_Dataset/UCI_HAR_Dataset.zip", method = "curl")


list.files("../Specialization")
dateDownloaded <- date()
dateDownloaded

### Step two 
# Unzziped the file
# Set working directory setwd() 
# Unzipped the data set in 'UCI_HAR_Dataset'
# The dataset directory is same as this script.  
setwd("../Specialization/UCI_HAR_Dataset")

# Dataset directories
dataTestDirectory <- "./UCI HAR Dataset/test/"
dataTrainDirectory <- "UCI HAR Dataset/train/"




### Step 3
# Package Check and Install
library(reshape2)
# or 
pkg <- "reshape2"
if (!require(pkg, character.only = TRUE)) {
  install.packages(pkg)
  if (!require(pkg, character.only = TRUE)) 
    stop(paste("Load failure: ", pkg))
}

### Step 4
# Read dataset
activities <- read.table(paste0(dataBaseDirectory, "activity_labels.txt"), header=FALSE, stringsAsFactors=FALSE)
features <- read.table(paste0(dataBaseDirectory, "features.txt"), header=FALSE, stringsAsFactors=FALSE)


###Step 5
# Import and prepare the test Data
subject_test <- read.table(paste0(dataTestDirectory, "subject_test.txt"), header=FALSE)
x_test <- read.table(paste0(dataTestDirectory, "X_test.txt"), header=FALSE)
y_test <- read.table(paste0(dataTestDirectory, "y_test.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_test$V1, labels = activities$V2))
testData <- cbind(tmp, subject_test, x_test)

# Import and prepare the train Data
subject_train <- read.table(paste0(dataTrainDirectory, "subject_train.txt"), header=FALSE)
x_train <- read.table(paste0(dataTrainDirectory, "X_train.txt"), header=FALSE)
y_train <- read.table(paste0(dataTrainDirectory, "y_train.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_train$V1, labels = activities$V2))
trainData <- cbind(tmp, subject_train, x_train)


### Step 6
# Tidy Data
testTidyData <- rbind(testData, trainData)
names(testTidyData) <- c("Activity", "Subject", features[,2])
select <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
tidyData <- testTidyData[c("Activity", "Subject", select)]

# Write Tidy Data to Disk
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)


###Step 7
# Tidy Data Average/Activity. Melt and Cast.
tidyData_Melt <- melt(tidyData, id=c("Activity", "Subject"), measure.vars=select)
tidyData_Mean <- dcast(tidyData_Melt, Activity + Subject ~ variable, mean)

# Write Tidy Average Data
write.table(tidyData_Mean, file="./tidyAverageData.txt", row.names=FALSE)
message(" DONE")