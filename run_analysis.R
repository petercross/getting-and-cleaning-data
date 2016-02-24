## Created by: Peter Cross
## Modified: 20160224
## Purpose:
## Created for Getting and Cleaning Data Coursera Course project.

#################### USER INPUTS ####################

wd_input <- "[Directory where raw dataset exists]"

################## END USER INPUTS ##################

#Clears the workspace
rm(list=ls());

setwd(wd_input)

#load raw data for aggregation
features <- read.table('./features.txt',header=FALSE)
activity_type <- read.table('./activity_labels.txt',header=FALSE)
subj_train <- read.table('./train/subject_train.txt',header=FALSE)
x_train <- read.table('./train/x_train.txt',header=FALSE)
y_train <- read.table('./train/y_train.txt',header=FALSE)
subj_test <- read.table('./test/subject_test.txt',header=FALSE)
x_test <- read.table('./test/x_test.txt',header=FALSE)
y_test <- read.table('./test/y_test.txt',header=FALSE)

#assigning column names for each of the raw datasets
colnames(activity_type) <- c('activity_id','activity')
colnames(subj_train) <- "subject_id"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activity_id"
colnames(subj_test) <- "subject_id"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activity_id"

#aggregating training and testing datasets from raw inputs
data_test <- cbind(y_test,subj_test,x_test)
data_train <- cbind(y_train,subj_train,x_train)

#creating combined dataset of training and testing datasets
data_combined <- rbind(data_test,data_train)
colnames(data_combined) <- tolower(colnames(data_combined))

#### End Step 1

#extracting colnames from the combined dataset for exclusion operations
dc_colnames <- colnames(data_combined)

#creates a logical vector using regex matching for ID columns and any Standard Deviation or mean columns
logvect <- grepl("activity_id",dc_colnames) | grepl("subject_id",dc_colnames) | grepl("(-mean)[^A-z]",dc_colnames) | grepl("(-std)[^A-z]",dc_colnames)

#filters unmatched columns
data_filter1 <- data_combined[logvect==TRUE]

#### End Step 2

#merges the activity_type raw dataset for readable activity_id translations
data_filter1 <- merge(data_filter1,activity_type,by='activity_id',all.x=TRUE)

#extracts colnames for transformation to human-readable
df1_colnames <- colnames(data_filter1)

#loops through df1_colnames vector and substitutes more easily readable column names
for (i in 1:length(df1_colnames)) 
{
  df1_colnames[i] = gsub("\\()","",df1_colnames[i])
  df1_colnames[i] = gsub("(-std)","_stddev",df1_colnames[i])
  df1_colnames[i] = gsub("(-mean)","_mean",df1_colnames[i])
  df1_colnames[i] = gsub("^(t)","time",df1_colnames[i])
  df1_colnames[i] = gsub("^(f)","freq",df1_colnames[i])
  df1_colnames[i] = gsub("(bodybody|body)","_body",df1_colnames[i])
  df1_colnames[i] = gsub("(gyro)","_gyroscope",df1_colnames[i])
  df1_colnames[i] = gsub("(mag)","_magnitude",df1_colnames[i])
  df1_colnames[i] = gsub("(acc)","_accelleration",df1_colnames[i])
  df1_colnames[i] = gsub("(jerk)","_jerk",df1_colnames[i])
  df1_colnames[i] = gsub("(gravity)","_gravity",df1_colnames[i])
  df1_colnames[i] = gsub("(-x)","_x-axis",df1_colnames[i])
  df1_colnames[i] = gsub("(-y)","_y-axis",df1_colnames[i])
  df1_colnames[i] = gsub("(-z)","_z-axis",df1_colnames[i])
};

#reads back transformed column names into the data frame
colnames(data_filter1) <- df1_colnames

data_step4 <- data_filter1

#### End Step 3 and 4

#removing human readable column activity for finding means
data_final_2 <- data_filter1[,names(data_filter1) != 'activity']

#finds means grouped by activity_id and subject_id
data_final_2 <- aggregate(data_final_2[,names(data_final_2) != c('activity_id','subject_id')],by=list(activity_id=data_final_2$activity,subject_id=data_final_2$subject_id),mean)

#adds back in human readable activity column joined on activity_id
data_final_2 <- merge(data_final_2,activity_type,by='activity_id',all.x=TRUE)

#writes table to text file
write.table(data_final_2, './tidy_dataset.txt',row.names=FALSE,sep='\t')

#### End Step 5