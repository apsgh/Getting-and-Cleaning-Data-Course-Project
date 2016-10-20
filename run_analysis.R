# Load 'downloader' package
library(downloader)

# Download and save the file in working directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileUrl, "QuizData.zip", mode = "wb")

# Unzip the downloaded file
unzip("QuizData.zip",exdir = "./QuizData")

#  Read data from downloaded dataset
xtrain<- read.table("./QuizData/UCI HAR Dataset/train/X_train.txt")
ytrain<- read.table("./QuizData/UCI HAR Dataset/train/y_train.txt")
xtest<- read.table("./QuizData/UCI HAR Dataset/test/X_test.txt")
ytest<- read.table("./QuizData/UCI HAR Dataset/test/y_test.txt")
subjectTrain <- read.table("./QuizData/UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./QuizData/UCI HAR Dataset/test/subject_test.txt")
activitylabel <- read.table("./QuizData/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./QuizData/UCI HAR Dataset/features.txt")

# Combine training and test data
readings<- rbind(xtrain,xtest)
activity<- rbind(ytrain,ytest)
subjects <- rbind(subjectTrain,subjectTest)

# Assign appropriate names to variables
names(readings) <- features$V2
names(activity) <- c ("activityID")
names(subjects) <- c ("subjectID")

# 1.Merges the data sets to create one data set
joinedData<- cbind(subjects,activity,readings)

# 2.Extract only the measurements on the mean and standard deviation for each measurement
dtmeanstd<-joinedData[,grep("mean\\(\\)|std\\(\\)|subjectID|activityID", names(joinedData))]

# Rename the column name in 'activitylabel' from 'V1' to 'activityID'  
names(activitylabel)[names(activitylabel) == "V1"] <- "activityID"

# 3.Use descriptive activity names to name the activities in the data set
dtmeanstd <- merge(activitylabel,dtmeanstd, by = "activityID")

# 4.Appropriately label the data set with descriptive variable names
names(dtmeanstd)[names(dtmeanstd) == "V2"] <- "ActivityName"

# Load 'plyr' package
library(plyr)

#Create a independent tidy data set with average of each variable for each activity & each subject
tidydata<-ddply(dtmeanstd, c("subjectID","ActivityName"), numcolwise(mean))
write.table(tidydata, file="tidydata.txt",row.names=FALSE)
