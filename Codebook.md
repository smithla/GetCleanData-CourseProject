
   ##Codebook  - Clean and Tidy UCI HAR Dataset
   
    In cleaning this dataset, the decision was made to drop all columns with the heading "meanFreq". This
    results in a more consistant set of data. The labels were changed from "t" and "f" to "Time_" and "Freq_"
    which is easier to read. All variable name (columns) are under 30 characters, which is neccessary 
    if the data is to be loaded into an Oracle database. 

    #### Activities:

    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING
    
    69 Columns 
    
    ### Features (column names)    - All columns ending in mean_(XYZ) or std(XYZ) have been normalized 
     to a range of (-1,1)

     Column Name                Description

     -Activity_Number           The Activity Number

     -Activity_Label            The Activity Label - One of the 6 activities listed above

     -Subject_Number            The Subject Number - One of 30 possible subjects

     -Time_BodyAcc_mean_X       The mean time of the Body Acceleration on the X-axis

     -Time_BodyAcc_mean_Y       The mean time of the Body Acceleration on the Y-axis

     -Time_BodyAcc_mean_Z       The mean time of the Body Acceleration on the Z-axis

     -Time_BodyAcc_std_X        The mean  standard deviation of time on the Body Acceleration on the Z-axis

     -Time_BodyAcc_std_Y        The mean standard deviation of time on the Body Acceleration on the Z-axis

     -Time_BodyAcc_std_Z        The mean standard deviation of time on the Body Acceleration on the Z-axis

     -Time_GravityAcc_mean_X    The mean time of accleration due to Gravity on the X-axis

     -Time_GravityAcc_mean_Y    The mean time of accleration due to Gravity on the Y-axis

     -Time_GravityAcc_mean_Z    The mean time of accleration due to Gravity on the Z-axis

     -Time_GravityAcc_std_X     The mean standard deviation of time due to Gravity on the X-axis

     -Time_GravityAcc_std_Y     The mean standard deviation of time due to Gravity on the Y-axis

     -Time_GravityAcc_std_Z     The mean standard deviation of time due to Gravity on the Z-axis

     -Time_BodyAccJerk_mean_X   The mean time of accleration due to Body Jerk - X axis

     -Time_BodyAccJerk_mean_Y   The mean time of accleration due to Body Jerk - Y axis

     -Time_BodyAccJerk_mean_Z   The mean time of accleration due to Body Jerk - Z axis

     -Time_BodyAccJerk_std_X    The mean standard deviation of time due to Body Accleration Jerk - X axis

     -Time_BodyAccJerk_std_Y    The mean standard deviation of time due to Body Accleration Jerk - Y axis

     -Time_BodyAccJerk_std_Z    The mean standard deviation of time due to Body Accleration Jerk - Z axis

     -Time_BodyGyro_mean_X      The mean time due to Body Gyro - X axis

     -Time_BodyGyro_mean_Y      The mean time due to Body Gyro - Y axis

     -Time_BodyGyro_mean_Z      The mean time due to Body Gyro - Z axis

     -Time_BodyGyro_std_X       The mean standard deviation of time in the Body Gryo - X axis

     -Time_BodyGyro_std_Y       The mean standard deviation of time in the Body Gryo - Y axis

     -Time_BodyGyro_std_Z       The mean standard deviation of time in the Body Gryo - Z axis

     -Time_BodyGyroJerk_mean_X  The mean time due to Body Gyro Jerk - X axis

     -Time_BodyGyroJerk_mean_Y  The mean time due to Body Gyro Jerk - X axis

     -Time_BodyGyroJerk_mean_Z  The mean time due to Body Gyro Jerk - X axis

     -Time_BodyGyroJerk_std_X   The mean standard deviation of time in the Body Gryo Jerk - X axis

     -Time_BodyGyroJerk_std_Y   The mean standard deviation of time in the Body Gryo Jerk - Y axis

     -Time_BodyGyroJerk_std_Z   The mean standard deviation of time in the Body Gryo Jerk - Z axis

     -Time_BodyAccMag_mean      The mean time in the Body Accleration Magnititude

     -Time_BodyAccMag_std       The mean standard deviation of time in the Body Accleration Magnititude

     -Time_GravityAccMag_mean   The mean time in the Gravity Accleration Magnititude

     -Time_GravityAccMag_std    The mean standard deviation of time in the Gravity Accleration Magnititude

     -Time_BodyAccJerkMag_mean  The mean time in the Body Accleration Jerk Magnititude

     -Time_BodyAccJerkMag_std   The mean standard deviation of time  in the Body Accleraton Jerk Magnititude

     -Time_BodyGyroMag_mean     The mean time in the Body Gyro Magnititude

     -Time_BodyGyroMag_std      The mean standard deviation of time in the Body Gyro Magnititude

     -Time_BodyGyroJerkMag_mean The mean time in the Body Gyro Jerk Magnititude

     -Time_BodyGyroJerkMag_std  The mean standard deviation of time in the Body Gyro Jerk Magnititude

     -Freq_BodyAcc_mean_X       The mean frequency of the Body Acceleration on the X-axis

     -Freq_BodyAcc_mean_Y       The mean frequency of the Body Acceleration on the Y-axis

     -Freq_BodyAcc_mean_Z       The mean frequency of the Body Acceleration on the Z-axis

     -Freq_BodyAcc_std_X        The mean of the standard deviation of frequency of Body Aceleration X - axis

     -Freq_BodyAcc_std_Y        The mean of the standard deviation of frequency of Body Aceleration Y - axis

     -Freq_BodyAcc_std_Z        The mean of the standard deviation of frequency of Body Aceleration Z - axis

     -Freq_BodyAccJerk_mean_X   The mean frequency of the Body Acceleration Jerk on the X-axis

     -Freq_BodyAccJerk_mean_Y   The mean frequency of the Body Acceleration Jerk on the Y-axis

     -Freq_BodyAccJerk_mean_Z   The mean frequency of the Body Acceleration Jerk on the Z-axis

     -Freq_BodyAccJerk_std_X    The mean of the standard deviation of frequency of Body Aceleration Jerk X - axis

     -Freq_BodyAccJerk_std_Y    The mean of the standard deviation of frequency of Body Aceleration Jerk Y - axis

     -Freq_BodyAccJerk_std_Z    The mean of the standard deviation of frequency of Body Aceleration Jerk Z - axis

     -Freq_BodyGyro_mean_X      The mean frequency of the Body Gyro on the X-axis

     -Freq_BodyGyro_mean_Y      The mean frequency of the Body Gyro on the X-axis

     -Freq_BodyGyro_mean_Z      The mean frequency of the Body Gyro on the X-axis

     -Freq_BodyGyro_std_X       The mean of the standard deviation of frequency of Body Gyro Z - axis

     -Freq_BodyGyro_std_Y       The mean of the standard deviation of frequency of Body Gyro Z - axis

     -Freq_BodyGyro_std_Z       The mean of the standard deviation of frequency of Body Gyro Z - axis

     -Freq_BodyAccMag_mean      The mean frequency of the Body Accleration Magnititude

     -Freq_BodyAccMag_std       The mean of the standard deviation of frequency of Body Aceleration Z - axis

     -Freq_BodyAccJerkMag_mean   The mean frequency of the Body Accleration Jerk Magnititude

     -Freq_BodyAccJerkMag_std    The mean of the standard deviation of frequency of Body Accleration Jerk Magnititude

     -Freq_BodyGyroMag_mean      The mean frequency of the Body Gryo Magnititude

     -Freq_BodyGyroMag_std       The mean of the standard deviation of frequency of the Body Gyro Magnititude

     -Freq_BodyGyroJerkMag_mean  The mean frequency of the Body Gryo Jerk Magnititude

     -Freq_BodyGyroJerkMag_std   The mean of the standard deviation of frequency of the Body Gyro Jerk Magnititude