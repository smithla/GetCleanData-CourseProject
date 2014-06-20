GetCleanData-CourseProject
==========================

Course project repo for Getting and Cleaning Data class. Cousera.

###  README

 This project takes the data from the Human Activity Recognition Using Smartphones Dataset and condenses and reformats the data into a smaller, cleaner data set.
 
#### Setup
 
 The dataset can be downloaded at:
  - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
  - Once the dataset is downloaded, it must be unzipped. 
  - Move the r script: run_analysis.R into the UCI HAR Dataset folder.
  - Set your R Studio working directory to the UCI HAR Dataset folder
 
### Code discription

 The script to run is run_analysis.R
 It is broken down into 5 steps, which are clearly marked in the comments of the R file. This script MUST be run from the  UCI HAR Dataset folder
 
 The project has 5 steps. Each of them are well marked in the code comments. They are not done
 in the order shown below due. For example, it is simpler to add discriptive names before merging the testing and training sets.
 
   1) Merges the training and the test sets to create one data set.
   2) Extracts only the measurements on the mean and standard deviation for each measurement.
   3) Uses descriptive activity names to name the activities in the data set
   4) Appropriately labels the data set with descriptive variable names.
   5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


 
 There are # parts to the code. In some of the parts, 
 
 Part 1 Read in the data files needed for the dataset transformation
      This section used the following files
  -  features.txt
  -  activity_labels.txt
  - ./test/Y_tests.txt
  - ./train/Y_train.txt
  - ./test/subject_test.txt
  - ./train/submect_train.txt
  - ./test/X_test.txt
  - ./train/X_train.txt
      
 Part 2 Combine the Y train and Y test columns to the test and train data.
   Y test and Y train are the activity numbers (1-6) that correspond to the activities.
   This step binds the activity number to it's corresponding test. As the colums are added
   the names are changed to Activity Number
 
 Part 3 merge the Activity Labels with the tesing and training data and then
   merge both sets together.Also, renaming of columns that were     changed durning the merge process. At the end of this    step, we have dtotal, the complete merged dataset.
 
 Part 4 Clean up the features and filter the dataset
  - read in the features
  - add 3 new features: Activity_Number,Activity_Name and Subject_Name
  - Clean up the features, Remove parenthesis and replace dates with underscores
  - Replace the prefixes "t" and "f" with "Time_" and "Freq_"
  - Filter out any column that is not an activity,subject, mean or standard devation.
  - Filter out any column that has the character string "meanFreq"

  Part 5 Use the cleaned features to filter the dataset
  - use the index of the features dataset to grab the correct rows from the test/train data
  - use the labels of the features dataset to rename the columns of the test/train data
  
  Part 6 Use melt and dcast to reshape the data into the tidy dataset
  - melt/dcast/reshape
  - write the file tidy_data.csv to the working directory
  
  End of code walk through


#### The Readme from the original dataset is below
 

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

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
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
