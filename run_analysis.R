################################################################################
#  Coursera:  Getting and Cleaning Data
#  Project One
#  Code by:  Jeffrey Parker
#  Created on:  May 20, 2015
#

library(dplyr)

#read all required tables
actlabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
testsubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
trainsubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

# select only mean and std columns
xtesttrim <- xtest[, grepl("std\\(\\)", features[,2]) | grepl("mean\\(\\)", features[,2])]
xtraintrim <- xtrain[, grepl("std\\(\\)", features[,2]) | grepl("mean\\(\\)", features[,2])]
colheadtrim <- features[grepl("std\\(\\)", features[,2]) | grepl("mean\\(\\)", features[,2]), 2]

#merge ytest and ytrain with activity labels
ytest <- merge(ytest, actlabels)
ytrain <- merge(ytrain, actlabels)

# add subject number in ytest and ytrain
xtestfinal <- cbind(testsubjects, ytest[,2], xtesttrim)
xtrainfinal <- cbind(trainsubjects, ytrain[,2], xtraintrim)

#rename features list
# remove (,), and -
colheadtrim <- gsub("-","",colheadtrim)
colheadtrim <- gsub("\\(","",colheadtrim)
colheadtrim <- gsub("\\)","",colheadtrim)

# replace mean with Mean, std with Std for proper formatting
colheadtrim <- gsub("mean","Mean",colheadtrim)# replace 
colheadtrim <- gsub("std","Std",colheadtrim)

# column names to x train and x test data
colheadings <- c("subjectid", "activity", colheadtrim)
colnames(xtestfinal) <- colheadings
colnames(xtrainfinal) <- colheadings

# combine test and train
xtotal <- rbind(xtestfinal, xtrainfinal)

# summarize with dplyr
summarytable <- xtotal %>% group_by (subjectid, activity) %>% summarise_each(funs(mean))

#write summary table to file
write.table(summarytable, "./data/summary_results.txt", sep = " ", row.name=FALSE)
