
# Getting and Cleaning Data - Course Project 6/2014

# The code in this file will only run if the R Studio working directory
# is set to the location of the unzipped UCI HAR dataset.

# Each of the 5 steps in the project will be marked in comments below 
# when that step has been achieved.
# I am doing the steps in the following order:

# Step 3 (split into two parts) I get the activity labels from activity_labels.txt
# Step 1 Combine Test and Traing datasets
# Step 4 Repair/Rename dataset Columns
# Step 2 Filter the full dataset down to only the mean and standard deviation columns
# Step 5 Create a tidy dataset of the means of the variables

# Activities:

#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING


# load the libraries
library(data.table)
library(reshape2)
library(plyr)

# Part 1 - Read in the data files needed for the dataset transformation 

# read activity labe1s
dactivity <- read.table("activity_labels.txt")

# load the activity numbers for the testing data
dtest_activity <- read.table("./test/Y_test.txt")

# load the activity numbers for the training data
dtrain_activity <- read.table("./train/Y_train.txt")

# load the subject test/train identifiers
dtest_subject <- read.table("./test/subject_test.txt")
dtrain_subject <- read.table("./train/subject_train.txt")

# load the testing data
dtest <- read.table("./test/X_test.txt")

# load the training data
dtrain <- read.table("./train/X_train.txt")

# Part 2 - combine the Y_train and Y_test columns to the test and train data

dtest <- cbind(dtest_activity,dtest)
colnames(dtest)[1] <- "Activity_Number"
dtrain <- cbind(dtrain_activity,dtrain)
colnames(dtrain)[1] <- "Activity_Number"

#  combine the subject test and train information to the test and train data
dtest <- cbind(dtest_subject,dtest)
colnames(dtest)[1] <- "Subject_Number"
dtrain <- cbind("Subject_Number"=dtrain_subject,dtrain)
colnames(dtrain)[1] <- "Subject_Number"

# rename the activity column
colnames(dactivity)[1] <- "Activity_Number"

# Part 3 merge the Activity Labels with the tesing and training data and then 
#  merge both sets together

###########################################################################
### Step 3: Uses descriptive activity names to name the activities in the data set
# merge the activity label with the test and training data
dtest <- merge(dactivity,dtest,by="Activity_Number")
dtrain <- merge(dactivity,dtrain,by="Activity_Number")
###########################################################################



#######################################################################
### Step 1: Merges the training and the test sets to create one data set.
# bind the two datasets together
dtotal <- rbind(dtest,dtrain)
######################################################################

# order by subject as a visual check
dtotal <- dtotal[with(dtotal, order(Subject_Number)),]
str(dtotal)

# rename the altered columns

colnames(dtotal)[names(dtotal) == "V2.y"] <- "V2"
colnames(dtotal)[names(dtotal) == "V2.x"] <- "Activity_Label"

# At this point, I am creating a features dataset that can be fileterd to get
# only the Mean and STD features

# Part 4 - Clean up the features and filter the dataset
# read in the features
dfeatures <- read.table("./features.txt",stringsAsFactors=FALSE)

# add the activity and subject column names using 0,-1,-2 as indexs 
# so they can be at the top 

dfeatures <- rbind(data.frame(V1 = 0,V2 = "Subject_Number"),dfeatures)
dfeatures <- rbind(data.frame(V1 = -1,V2 = "Activity_Label"),dfeatures)
dfeatures <- rbind(data.frame(V1 = -2,V2 = "Activity_Number"),dfeatures)

# reorder the V1 column in dfeatures to start at 1
dfeatures$V1 <- 1:nrow(dfeatures)


# clean up the features labels. I sure this could be done in one line, but my regex is rusty.
dfeatures$V2 <- gsub("\\(\\)","",dfeatures$V2)
dfeatures$V2 <- gsub("\\(","",dfeatures$V2)
dfeatures$V2 <- gsub("\\)","",dfeatures$V2)
dfeatures$V2 <- gsub("-","_",dfeatures$V2)
dfeatures$V2 <- gsub(",","_",dfeatures$V2)

###########################################################################################
### Step 4: Appropriately labels the data set with descriptive variable names. 
### I am choosing to replace the code prefixes "t" with "Time_ and the "f" with "Freq_"
### Please see the code book for further explaination/justification
dfeatures$V2 <- gsub("^t","Time_",dfeatures$V2)
dfeatures$V2 <- gsub("^f","Freq_",dfeatures$V2)
###########################################################################################

# break out the index of each feature, This is needed to pull the proper rows from dtotal
feature_numbers <- dfeatures[[1]]
# break out the name of each feature, This is needed to attach the proper labels
feature_labels <- dfeatures[[2]]
# check
str(feature_labels)

# grab the subject row
dfeatures_subject <- dfeatures[grepl("Subject",dfeatures$V2),]
# grab the two activity rows
dfeatures_activity <- dfeatures[grepl("Activity",dfeatures$V2),]
# grab all the features that have the string "mean" 
dfeatures_mean <- dfeatures[grepl("mean",dfeatures$V2),]
# ditto for sd
dfeatures_std <- dfeatures[grepl("std",dfeatures$V2),]
# put the mean and std dataframes together
dfeatures_mean_std <- rbind(dfeatures_subject,dfeatures_activity,dfeatures_mean,dfeatures_std)

# add the activity label and number to the dataset

# remove any row with the string "meanFreq"
# See the readme file for justification
dfeatures_mean_std <- subset(dfeatures_mean_std,!grepl("meanFreq",dfeatures_mean_std$V2))

# sort the mean/std data frame

dfeatures_mean_std <- dfeatures_mean_std[order(dfeatures_mean_std[,1]),]

# Part 5 Use the cleaned features to filter the dataset
# check
head(dfeatures_mean_std,68)
str(dfeatures_mean_std)
# pull out the vector index of dfeature_mean_std
mean_std_index <- dfeatures_mean_std[[1]]

# pull out the vector of feature names
mean_std_names <- dfeatures_mean_std[[2]]

#######################################################################################
### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# get a data frame with only the mean and std columns
d_feature_final <- dtotal[,mean_std_index]
######################################################################################

# assign the proper column names
colnames(d_feature_final) <- mean_std_names
nrow(d_feature_final)

# This is the final merged/pruned dataset

str(d_feature_final)

# Part 6 Use melt and dcast to reshape the data into the tidy dataset

# Use melt and dcast to create the tidy dataset
melted <- melt(d_feature_final,id=1:3)

######################################################################################
### Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_final <- dcast(melted,Activity_Number+Activity_Label+Subject_Number~variable,fun.aggregate = mean)
######################################################################################

# Write the tidy dataset to a file
write.csv(tidy_final,file="./tidy_data.txt",row.names=F)

# Check
str(tidy_final)
head(tidy_final)
tail(tidy_final)

