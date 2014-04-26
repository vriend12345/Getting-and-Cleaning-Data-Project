## run_analysis.R

## 3.
## Using descriptive activity names to name the activities in the data set

## Reading the activitiy labels
activities <- read.table("activity_labels.txt")
names(activities) <- c("ActivityID","ActivityName")
activities$ActivityName <- as.factor(activities$ActivityName)

## removing "_" and changing the name of the activities to lower case
activities$ActivityName <- gsub("_", "", tolower(as.character(activities$ActivityName)))


## Reading the features labels
features <- read.table("features.txt")
names(features) <- c("FeatureID","FeatureName")

## changing the name of the features to lower case
features$FeatureName <- tolower(features$FeatureName)

## Reading the test data
test <- read.table("test/X_test.txt", col.names=features$FeatureName)
testActivity <- read.table("test//y_test.txt", col.names=c("ActivityID"))        
testSubject <- read.table("test/subject_test.txt", col.names=c("SubjectID"))

## Reading the training data
train <- read.table("train/X_train.txt", col.names=features$FeatureName)
trainActivity <- read.table("train/y_train.txt", col.names=c("ActivityID"))
trainSubject <- read.table("train/subject_train.txt", col.names=c("SubjectID"))


## 2.
## Extracting only the measurements on the mean and standard deviation
## for each measurement using regular expressions.
subset_features <- grep(".*mean\\(\\)|.*std\\(\\)", features$FeatureName)
testData <- test[,subset_features]
trainData <- train[,subset_features]

## Appending the ActivityID and SubjectID columns
## for test data
testData$ActivityID <- testActivity$ActivityID
testData$SubjectID <- testSubject$SubjectID

## Appending the ActivityID and SubjectID columns
## for training data
trainData$ActivityID <- trainActivity$ActivityID
trainData$SubjectID <- trainSubject$SubjectID

## 1.
## Merging the test and the training sets to create one data set.
MergedData <- rbind(testData, trainData)


## 4.
## Appropriately labeling the data set with descriptive activity names. 
LabeledData <- merge(MergedData, activities)


## writing the labeled dataset
write.table(LabeledData, "labeled_data.txt")


## 5.
## Creating a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 

library(reshape2)

# melting the dataset
id_vars = c("ActivityID", "ActivityName", "SubjectID")
measure_vars = setdiff(colnames(LabeledData), id_vars)
MeltedData <- melt(LabeledData, id=id_vars, measure.vars=measure_vars)

# casting
TidyData <- dcast(MeltedData, ActivityName + SubjectID ~ variable, mean)    

## writing the labeled dataset
write.table(TidyData, "tidy_data.txt")
