# Loading Packages

library(data.table)
library(dplyr)

# Downloading and Unzipping Data

path <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
destination <-  '.\\Course3\\Week4\\data_project.zip'
download.file(url=path, destfile=destination, method='curl')
unzip(zipfile=destination, exdir='.')

# Reading the Data

X_train <- fread('.\\UCI HAR Dataset\\train\\X_train.txt', data.table=FALSE)
y_train <- fread('.\\UCI HAR Dataset\\train\\y_train.txt', data.table=FALSE)
subject_train <- fread('.\\UCI HAR Dataset\\train\\subject_train.txt', data.table=FALSE)

X_test <- fread('.\\UCI HAR Dataset\\test\\X_test.txt', data.table=FALSE) 
y_test <- fread('.\\UCI HAR Dataset\\test\\y_test.txt', data.table=FALSE)
subject_test <- fread('.\\UCI HAR Dataset\\test\\subject_test.txt', data.table=FALSE)

features <- fread('.\\UCI HAR Dataset\\features.txt', data.table=FALSE)
activity_labels <- fread('.\\UCI HAR Dataset\\activity_labels.txt', data.table=FALSE)

# Merging Data Sets

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Filtering out measurement columns with Mean and Standard Deviation

columns_to_keep <- features[grep('-mean\\(\\)|-std\\(\\)', features$V2),]
X_filtered = X[,columns_to_keep$V1]

# Renaming measurement columns

columns_to_keep$V2 <- gsub('[-//(//)]','',columns_to_keep$V2)
columns_to_keep$V2 <- gsub('mean','Mean',columns_to_keep$V2)
columns_to_keep$V2 <- gsub('std','Std',columns_to_keep$V2)
X_filtered_renamed <- rename_with(X_filtered, function(x) columns_to_keep$V2)

# Applying Descriptive names to activities. Adding Activity and Subject details to the Dataset

y$activity <- as.character(factor(y$V1, labels=activity_labels$V2))
X_filtered_renamed$subject <- subject$V1
X_filtered_renamed$activity <- y$activity

# Creating Tidy Dataset. Calculating means of all measurements for all combination of activities and subjects

data_tidy <- as.data.frame(X_filtered_renamed %>% group_by(activity, subject) %>% summarise_all(mean))

# Writing  tidy dataset to disk

write.csv(data_tidy, file='.\\Course3\\Week4\\data_tidy.csv',row.names=FALSE, quote=FALSE)


