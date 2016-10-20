This codebook describes the variables, the data, and any transformations or work that I have performed to clean up the data .

Data Collection:

Data is downloaded from UCI Machine Learning repository->  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Direct link to dataset->  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About Dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Data Transformation:
The script run_analysis.R script is used to create a tidy data set from the downloaded dataset.
The data is tranformed in following steps:
- Data is read from the downloaded dataset.
- Training data,test data,subject data,features and activity labels are combined to form a single dataset
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Descriptive activity names are used to name the activities in the data set
- Label the data set with descriptive variable names. 
- Create a independent tidy data set with average of each variable for each activity & each subject

Variable:

The final tidy data set contains folllowing variables:
- SubjectID : Identification of subject ranges from 1 to 30
- ActivityID :Identification of activity by number ranges from 1 to 6
- ActivityName : Name of activity ( WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- Measurements-Average of mean and standard deviations of tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag,   tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag,     fBodyGyroJerkMag (('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions))

The final tidy dataset is saved as 'tidydata.txt' in working directory