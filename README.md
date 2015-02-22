
# README.md


###
### Coursera - Getting and Cleaning Data - Course Project
### Author: Ian Grundy 
### Date: 22 February 2015
###


## CONTENTS OF THIS FILE
   
 * Introduction
 
 * Installation and Running
 
 * Credits
 

## Introduction

The included R script run\_analysis.R processes raw data from the following archive

     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data represents accelerometer data from the Samsung Galaxy S smartphone obtained by
monitoring various test subjects (humans - 30 in total) performing a number of 
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING).
The raw data is randomly partitioned into two sets; 70% of the data forms the training set
and 30% of the data forms the test set. The subject labels and activity labels are stored 
in separate files.

The script does the following tasks (but not necessarily in order):

 1. Merges the raw training and the test sets, together with the subject and activity data, to create one data set.
 
 2. Extracts only the measurements on the mean and standard deviation for each measurement. In practice this means that only columns whose names contain the strings "mean()" or "std()" are kept in the data set.
 
 3. Uses descriptive activity names to name the activities in the data set, by matching the activity names to the activity numbers in the raw data.
 
 4. Appropriately labels the data set with descriptive variable names. 
 
 5. From the data set in step 4, creates a second, independent tidy data set with the average 
    of each variable for each activity and each subject.

In order to reduce the size of data tables stored in memory, tasks 1,2 and 4 are done together. Tasks 3 and 5 then follow in sequence.

The process is described in more detail in the comments in run\_analysis.R.

The data is described in more detail in the attached document CodeBook.md.


## Installation & Running

The script assumes that the folder named "UCI HAR Dataset" sits in the same folder as run\_analysis.R.

To run the script, please type   source("run\_analysis.R")   at the prompt.

The script writes the tidy processed data to the space delimited text file  tidy\_data.txt.


## Credits

This submission was written by Ian Grundy ihgrundy@gmail.com  for the Coursera course "Getting and Cleaning Data".


