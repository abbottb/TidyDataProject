# This script produces the data set required for the Getting and Cleaning Data course project

# Load files

trainMeasurementsPath = "train/X_train.txt"
trainLabelsPath = "train/y_train.txt"
trainSubjectsPath = "train/subject_train.txt"
testMeasurementsPath = "test/X_test.txt"
testLabelsPath = "test/y_test.txt"
testSubjectsPath = "test/subject_test.txt"
colFilePath = "features.txt"
activityLabelsPath = "activity_labels.txt"

trainData <- read.table(trainMeasurementsPath, sep = "", header = FALSE)
trainLabels <- read.table(trainLabelsPath, sep = "", header = FALSE)
trainSubjects <- read.table(trainSubjectsPath, sep = "", header = FALSE)
testData <- read.table(testMeasurementsPath, sep = "", header = FALSE)
testLabels <- read.table(testLabelsPath, sep = "", header = FALSE)
testSubjects <- read.table(testSubjectsPath, sep = "", header = FALSE)
colNames <- read.table(colFilePath, sep = "", header = FALSE)
activityLabels <- read.table(activityLabelsPath, sep = "", header = FALSE)

# Give descriptive labels to variables (task #4 of assignment)

names(trainData) <- colNames[,2]
names(testData) <- colNames[,2]
names(trainLabels) <- "activityID"
names(testLabels) <- "activityID"
names(trainSubjects) <- "subjectID"
names(testSubjects) <- "subjectID"
names(activityLabels) <- c("activityID", "activityLabel")

# Combine dataasets (task #1 of assignment)

trainData <- cbind(trainLabels, trainSubjects, trainData)
testData <- cbind(testLabels, testSubjects, testData)
combinedData <- rbind(trainData, testData)
combinedData$subjectID <- factor(combinedData$subjectID)
rm(trainData, testData, trainLabels, testLabels, trainSubjects, testSubjects)

# Add descriptive activity names (task #3 of assignment)

combinedData <- merge(combinedData, activityLabels, by.x="activityID", by.y="activityID")

# Extract measures of mean and standard deviation (task #2 of assignment)

meanStDevCols <- grepl("\\-mean\\(\\)|\\-std\\(\\)", names(combinedData))
meanStDevData <- combinedData[,meanStDevCols]
meanStDevData <- cbind(subjectID = combinedData$subjectID, activityLabel = combinedData$activityLabel, meanStDevData)

# Create summary table with average of each variable for each activity and subject (task #5 of assignment)

library(dplyr)
meanStDevSummary <- meanStDevData %>% group_by(subjectID, activityLabel)
meanStDevSummary %>% summarize_each(funs(mean))
write.table(meanStDevSummary, file="tidy.txt", row.name = FALSE)
