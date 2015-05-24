# Code Book
This Code Book describes the variables, the data, and any transformations or work that I performed to clean up the data.

# Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Variables
For each file in the data set, I have a variable with the same name to store it.
* x_train
* y_train
* subject_train
* x_test
* y_test
* subject_test
* features
* activity_labels

After I merged the train set with test set, I use the variable name without train and test.
* x - merge of x_train and x_test
* y - merge of y_train and y_test
* subject - merge of subject_train and subject_test
* data - merge of x, y, and subject

# Transformation
I use features data to name x columns. I also added the column name for y and subject.
For step 2, I use grep function and assign the new result to x.
For step 3, I update the ids in y with the activity name in activity_labels. I also changed the column name to activity.
For step 4, I removed () and -. I changed mean to Mean, std to Std. I also changed the beginning t and f to time and freq.
For step 5, I get the column mean for 1 to 66 columns which are the columns in x, and output the result to a new file called average.txt
