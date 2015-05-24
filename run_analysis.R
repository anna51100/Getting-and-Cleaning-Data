# 1. Merges the training and the test sets to create one data set.
# get all data in R
library(plyr)
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# merge x
x <- rbind(x_train, x_test)
names(x) <- features[, 2]

# merge y
y <- rbind(y_train, y_test)
names(y) <- "activity_id"

# merge subject
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject_id"

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, mean_and_std]

# 3. Uses descriptive activity names to name the activities in the data set

# update actirity id with activity name
y[, 1] <- activity_labels[y[, 1], 2]
names(y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

# merge data together
data <- cbind(x, y, subject)
names(data) <- gsub("\\()", "", names(data)) 
names(data) <- gsub("-mean", "Mean", names(data)) 
names(data) <- gsub("-std", "Std", names(data))
names(data) <- gsub("-", "", names(data))  
names(data) <- gsub("^(t)","time",names(data))
names(data) <- gsub("^(f)","freq",names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
ncol(x) #66 columns in x
average <- ddply(data, .(subject_id, activity), function(x) colMeans(x[, 1:66]))

write.table(average, "average.txt", row.name=FALSE)
