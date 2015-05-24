Getting-and-Cleaning-Data-Course-Project

README explanatory notes

Data for analysis is downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files Included in Repository
    run_analysis.R
    CodeBook.md
    Samsung_Data.txt
    
Description of the run_analysis.R

The script performs analysis on the downloaded data to create a tidy datafile called Samsung_Data.txt
To run the script, you just have to download it to your R working directory and then: source(run_analysis.R)

Samsung data supposed to be in a folder called "Samsung" in working directory 
For this you need to download data (source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip),
and unzip to a folder to be named "Samsung" in your working directory

Script run_analysis.R does the following:
1. Load and merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Details of CodeBook.md
The code book file describes the variables, the data, and transformations and work performed to clean up the data.

Details of tidy data file Samsung_Data.txt

This is the tidy data file created after after running run_analysis.R script on the original data

This tidy dataset contains following

    180 observations and 68 variabiles (subject, activity + 66 columns for measurement variabiles)
    Each measurement variable column is average value for each combination of subject and activity





