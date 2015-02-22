
# Data Collection Description

## Title: Human Activity Recognition Using Smartphones Data Set 

## Source:

[ http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ]
( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

## Authors:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

## Summary: 

Experiments were carried out with a group of 30 volunteers ("subjects") within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

Using the accompanying file "run\_analysis.R", the training and the test sets created by Reyes-Ortiz et. al. were merged to create one data set. The size (width) of the dataset was reduced by selecting only those columns corresponding to the means and standard deviations (i.e including only measurement variables whose name contained mean() or std()). Descriptive activity names replaced activity numbers in the dataset.

From this data set, a new independent tidy data set was created consisting of four columns: "subject", "activity", "measurement" and "mean", where the "measurement" column contains the *names* of the measurement variables, and the "mean" column contains the average of each measurement variable for each activity and each subject.

### Extent of Collection: 

One tidy data file ("tidy\_data.txt"), 

Two human readable text files ("README.md", "CodeBook.md").


### Extent of Processing: 

Processing of raw data using "run\_analysis.R"


### Data Format: 

Space-delimited text file


## Codebook for tidied Human Activity Recognition Using Smartphones Data Set 

1. subject

        description: volunteer number
        
        values: integer (1 - 30)  
        
        
2. activity

        description: activity name
        
        values: (6) WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING
        
        
3. measurement

        description: measurement names
        
        values: (66)    tBodyAcc-mean()-X,tBodyAcc-mean()-Y,tBodyAcc-mean()-Z,tBodyAcc-std()-X,
        
                        tBodyAcc-std()-Y,tBodyAcc-std()-Z,tGravityAcc-mean()-X,
                        
                        tGravityAcc-mean()-Y,tGravityAcc-mean()-Z,tGravityAcc-std()-X,
                        
                        tGravityAcc-std()-Y,tGravityAcc-std()-Z,tBodyAccJerk-mean()-X,
                        
                        tBodyAccJerk-mean()-Y,tBodyAccJerk-mean()-Z,tBodyAccJerk-std()-X,
                        
                        tBodyAccJerk-std()-Y,tBodyAccJerk-std()-Z,tBodyGyro-mean()-X,
                        
                        tBodyGyro-mean()-Y,tBodyGyro-mean()-Z,tBodyGyro-std()-X,
                        
                        tBodyGyro-std()-Y,tBodyGyro-std()-Z,tBodyGyroJerk-mean()-X,
                        
                        tBodyGyroJerk-mean()-Y,tBodyGyroJerk-mean()-Z,tBodyGyroJerk-std()-X,
                        
                        tBodyGyroJerk-std()-Y,tBodyGyroJerk-std()-Z,tBodyAccMag-mean(),
                        
                        tBodyAccMag-std(),tGravityAccMag-mean(),tGravityAccMag-std(),
                        
                        tBodyAccJerkMag-mean(),tBodyAccJerkMag-std(),tBodyGyroMag-mean(),
                        
                        tBodyGyroMag-std(),tBodyGyroJerkMag-mean(),tBodyGyroJerkMag-std(),
                        
                        fBodyAcc-mean()-X,fBodyAcc-mean()-Y,fBodyAcc-mean()-Z,
                        
                        fBodyAcc-std()-X,fBodyAcc-std()-Y,fBodyAcc-std()-Z,
                        
                        fBodyAccJerk-mean()-X,fBodyAccJerk-mean()-Y,fBodyAccJerk-mean()-Z,
                        
                        fBodyAccJerk-std()-X,fBodyAccJerk-std()-Y,fBodyAccJerk-std()-Z,
                        
                        fBodyGyro-mean()-X,fBodyGyro-mean()-Y,fBodyGyro-mean()-Z,
                        
                        fBodyGyro-std()-X,fBodyGyro-std()-Y,fBodyGyro-std()-Z,
                        
                        fBodyAccMag-mean(),fBodyAccMag-std(),fBodyBodyAccJerkMag-mean(),
                        
                        fBodyBodyAccJerkMag-std(),fBodyBodyGyroMag-mean(),fBodyBodyGyroMag-std(),
                        
                        fBodyBodyGyroJerkMag-mean(),fBodyBodyGyroJerkMag-std()
        
        
4. mean

        description: mean of each measurement variable, for each subject and activity
        
        values: numeric (min: -0.9976661, max: 0.9745087) 
        


