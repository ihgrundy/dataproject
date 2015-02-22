###
### Coursera - Getting and Cleaning Data - Course Project
### Author: Ian Grundy 
### Date: 22 February 2015
###

### This R script takes data from the following archive
###
###     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
###
### The data represents accelerometer data from the Samsung Galaxy S smartphone obtained by
### monitoring various test subjects (humans - 30 in total) performing a number of 
### activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### The script does the following tasks (but not in order):
### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names. 
### 5. From the data set in step 4, creates a second, independent tidy data set with the average 
###    of each variable for each activity and each subject.
###
### Tasks 1,2 and 4 are done together. Tasks 3 and 5 then follow in sequence.

### To run this script, type   source("run_analysis.R")   at the prompt.
### This script assumes that the folder named "UCI HAR Dataset" sits in the same folder as "run_analysis.R".

### Preliminaries

library(dplyr)
library(tidyr)

### [ PART 1] Merges the training and the test sets to create one data set.
### [ PART 2] Extract only the measurements on the mean and standard deviation for each measurement. 
### [ PART 4] Appropriately labels the data set with descriptive variable names. 

### Reads the features (measurement types) from file, taking note of which feature names include the strings
### "mean()" and "std()". The indices of these special columns are noted.

cat("Reading Features")

features <- read.table("./UCI HAR Dataset/features.txt") ## 561 x 2
indices <- grep("mean[\\(\\)]|std[\\(\\)]",features[,2])
cat("   ... read",nrow(features),"rows x",ncol(features),"columns\n")

### This section reads the training set X_train and test set X_test from file and inserts the column names. 
### Only the special mean() and std() columns are included.
### X_train and X_test are then stacked using rbind() to form the "xcolumns" table
### Redundant data tables are removed as we go.

cat("Reading Training Variables")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt") ## 7352 x 561
cat("   ... read",nrow(xtrain),"rows x",ncol(xtrain),"columns\n")
colnames(xtrain) <- features[,2]
xtrainsubset <- xtrain[,indices]   ## only keep special columns
rm(xtrain)

cat("Reading Test Variables")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt") ## 2947 x 561
cat("   ... read",nrow(xtest),"rows x",ncol(xtest),"columns\n")
colnames(xtest) <- features[,2]
xtestsubset <- xtest[,indices]   ## only keep special columns
rm(xtest)

cat("Building X columns")
xcolumns <- rbind(xtrainsubset, xtestsubset)
cat("   ... built",nrow(xcolumns),"rows x",ncol(xcolumns),"columns\n")
rm(xtrainsubset, xtestsubset)

### This section reads the Y labels y_train and y_test from file and inserts the column name ("activity"). 
### y_train and y_test are then stacked using rbind() to form the "ycolumn" table
### Redundant data tables are removed as we go.

cat("Reading Training Labels")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") ## 7352 x 1
cat("   ... read",nrow(ytrain),"rows x",ncol(ytrain),"columns\n")

cat("Reading Test Labels")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") ## 2947 x 1
cat("   ... read",nrow(ytest),"rows x",ncol(ytest),"columns\n")

cat("Building Y column")
ycolumn <- rbind(ytrain, ytest)
names(ycolumn) <- ("activity")
cat("   ... built",nrow(ycolumn),"rows x",ncol(ycolumn),"columns\n")
rm(ytrain, ytest)

### This section reads the Subject labels subject_train and subject_test from file 
### and inserts the column name ("subject"). 
### subject_train and subject_test are then stacked using rbind() to form the "subjectcolumn" table
### Redundant data tables are removed as we go.

cat("Reading Training Subjects")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") ## 7352 x 1
cat("   ... read",nrow(subjecttrain),"rows x",ncol(subjecttrain),"columns\n")

cat("Reading Test Subjects")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## 2947 x 1
cat("   ... read",nrow(subjecttest),"rows x",ncol(subjecttest),"columns\n")

cat("Building Subject column")
subjectcolumn <- rbind(subjecttrain, subjecttest)
names(subjectcolumn) <- ("subject")
cat("   ... built",nrow(subjectcolumn),"rows x",ncol(subjectcolumn),"columns\n")
rm(subjecttrain, subjecttest)

### This section builds the full data set by placing the stacked columns subjectcolumn, 
### ycolumn, and xcolumns side by side using cbind(). 
### Redundant data tables are removed as we go.

cat("Building Full Data Set")
full_data_set <- cbind(subjectcolumn, ycolumn, xcolumns)
cat("   ... built",nrow(full_data_set),"rows x",ncol(full_data_set),"columns\n")
rm(subjectcolumn, ycolumn, xcolumns)

## [ PART 3] Use descriptive activity names to name the activities in the data set

### This section reads the numerical activity labels and the corresponding activity descriptions
### from file. The numerical labels in the full data set are matched and replaced by the descriptive labels.

cat("Reading Activity Labels")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt") ## 6 x 2
cat("   ... read",nrow(labels),"rows x",ncol(labels),"columns\n")
names(labels) <- c("key", "activity")
oldvalues <- factor(labels$key)
newvalues <- factor(labels$activity)

cat("Refresh Activity Column\n")
full_data_set$activity <- newvalues[ match(full_data_set$activity, oldvalues) ]

### [ PART 5 ] Create a second, independent tidy data set with the average of each variable 
### for each activity and each subject.

### This section builds a "long" data table named "final_tidy_data_set" 
### from the wide data table "full_data_set" which was created above.
### This is achieved by 
### 1. Stacking the "full_data_set" data in a long data table where a new column named "measurement" contains the 
###    column names from the full_data_set, and a new variable "derived_values" contains the corresponding
###    values stored in the columns of the full_data_set. We will call them "derived values" as they are 
###    the values of mean() and std() variables *derived* from the raw experimental measurements.
### 2. There are many "derived values" for each combination of subject, activity and measurement type. 
###    We group the data by subject, activity and measurement and then compute the mean over all of the 
###    "derived values" for each combination using summarize(). 

cat("Building Tidy Data Set")
stacked <- gather(full_data_set, measurement, derived_values, -(subject:activity))

by_subject_and_activity_and_measurement <- group_by(stacked, subject, activity, measurement)

final_tidy_data_set <- summarize(by_subject_and_activity_and_measurement, mean = mean(derived_values))
cat("   ... built",nrow(final_tidy_data_set),"rows x",ncol(final_tidy_data_set),"columns\n")
rm(stacked, by_subject_and_activity_and_measurement)

###
### Write the tidy data set to file in the format requested.
###

cat("Writing Tidy Data Set to File")
write.table(final_tidy_data_set, "./tidy_data.txt", row.name=FALSE ) 
cat("   ... writing data to <tidy_data.txt>\n")

