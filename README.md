**"Getting and Cleaning Data"** Course Project


The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Review criterialess 

 1. The submitted data set is tidy.
 2. The Github repo contains the required scripts.
 3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
 4. The README that explains the analysis files is clear and understandable.
 5. The work submitted for this project is the work of the student who submitted it.
 
 Here are the data for the project:

[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called run_analysis.R that does the following.

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject.
  
## Steps

   1. Reading data with read.table
   2. Matching labels with cbind
   3. Merges the training and the test with rbind
   4. Extracts only the measurements on the mean and standard deviation for each measurement with grep and merged
   5. Column into a factor variable with as.factor
   6. Creates a second, independent tidy data set with lapply
   7. Data set as a txt file created with write.table() using row.name=FALSE 
   
   ***Have a nice day!***
