# Reading data

testx<- read.table('test/X_test.txt')
testy <- read.table('test/y_test.txt')
tests <- read.table('test/subject_test.txt')
trainx <- read.table('train/X_train.txt')
trainy <- read.table('train/y_train.txt')
trains <- read.table('train/subject_train.txt')

# Matching labels
test <- cbind(tests, testy, testx)
train <- cbind(trains, trainy, trainx)

# Merges the training and the test sets to create one data set
merged <- rbind(test, train)

# Label the columns using the names in 'features.txt'
col_names <- read.table('features.txt')[[2]]
names(merged) <- c('subject', 'activity', as.character(col_names))

# Extracts only the measurements on the mean and standard deviation for each measurement
meanstd_colnames <- grep('mean|Mean|std', names(merged), value=TRUE)
meanstd_only <- merged[, c('subject', 'activity', meanstd_colnames)]

# 'activity' column into a factor variable with the proper names
activity_names <- as.character(read.table('activity_labels.txt')[[2]])
meanstd_only$activity <- as.factor(meanstd_only$activity)
levels(meanstd_only$activity) <- activity_names

#'subject' column into a factor variable
meanstd_only$subject <- as.factor(meanstd_only$subject)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
grp_cols <- names(meanstd_only)[c(1, 2)]
dots <- lapply(grp_cols, as.symbol)
tidy_data  <- meanstd_only %>% group_by(.dots=dots) %>% summarize_each(funs(mean))

# Please upload your data set as a txt file created with write.table() using row.name=FALSE
write.table(tidy_data ,file = " tidy_data.txt", row.names = FALSE)
