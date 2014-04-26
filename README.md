Getting and Cleaning Data - Project
========================================================
This repository presents a script for analyzing the data that collected from the accelerometers from the Samsung Galaxy S smartphone.

**Data Source:**
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

For detailed information about the dataset see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Original Dataset:**
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## How to run the script?
* Download the original dataset from the link above.
* Extract the contents of the dataset.
* Set your working directory in R as the UCI HAR Dataset folder.
* Download the <code>run_analysis.R</code> file and load it to your workspace.
* Run <code>run_analysis.R</code> file.

## How does the script works?
This script do the following:
* Read the test and training data.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names. 
* Outputs a labeled dataset <code>labeled_data.txt</code> 10299 observations, 69 variables, 7.97 MB. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* Outputs a tidy dataset <code>tidy_data.txt</code> 180 observations, 68 variables, 219 KB. 


## What does the script need?
This script uses "reshape2" R package.
If it was not installed in your R environment, use the following line.
```{r}
install.packages("reshape2")
```
