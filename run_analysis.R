## IMPORTANT: The code should be in the working directory
## IMPORTANT: Samsung data supposed to be in a folder called "Samsung" in working directory 
## IMPORTANT: Download data (source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip),
## IMPORTANT: unzip to a folder to be named "Samsung" in your working directory

## Script run_analysis.R does the following:
## 1. Load and merge the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


library(data.table)

## Read metadata
features <- read.table("./Samsung/features.txt")
activities <- read.table("./Samsung/activity_labels.txt")

# Read the test and train raw data into R:
subjecttest <- read.table("./Samsung/test/subject_test.txt")
xtest <- read.table("./Samsung/test/X_test.txt")
ytest <- read.table("./Samsung/test/Y_test.txt")

subjecttrain <- read.table("./Samsung/train/subject_train.txt")
xtrain <- read.table("./Samsung/train/X_train.txt")
ytrain <- read.table("./Samsung/train/Y_train.txt")

# Merge into one dataset
xall <- rbind(xtrain, xtest)
yall <- rbind(ytrain, ytest)
subjectall <- rbind(subjecttrain, subjecttest)

complete <- cbind(subjectall, yall, xall)  

# Name columns after feature
featurename <- as.character(features[,2])
Columnname <- c("subject", "activity", featurename)
colnames(complete) <- Columnname

# Extracts only the measurements on the mean and standard deviation for each measurement
Mean <- grep("mean()", colnames(complete))
StDev <- grep("std()", colnames(complete))

newColumns <- c(Mean, StDev)
newColumns <- sort(newColumns) 
newDataFrame <- complete[, c(1,2,newColumns)]

#delete the meanFreq columns
newDataFrame <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] 

# Make tidy dataframe with the average of each variable for each activity and each subject.
tidyframe <- data.frame()

for (i in 1:30) {
  subject<- subset(newDataFrame,subject==i)
  for (j in 1:6){
    activity<- subset(subject, activity==j)
    result<-as.vector(apply(activity,2,mean))
    tidyframe<-rbind(tidyframe,result) 
  }
  
}

#rename the columns
colnames(tidyframe)<-colnames(newDataFrame)
levels(tidyframe[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')

# Write output to "Samsung_Data.txt"
write.table(tidyframe, "Samsung_Data.txt", sep = "\t", row.name=FALSE)
