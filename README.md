Overview
======================

This script will merge Samsung smart phone datasets on Human Activity Recognition to obtain the mean and standard deviation of the X,Y,Z axis grouped by subject and activity.

The resulting script will return a tiny dataset.

Running
======================

This script looks in the current working directory for a folder named 'UCI HAR Dataset' to find the appropriate data. The complete structure required is shown below:

* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt

The script will first read all of the above files into R. It will then assign appropriate headers for all data, merging them into a complete dataset. The mean and std data is the only data retained. Finally a new tiny dataset is created by melting the data frame by subject and activities, then the means and standard deviations are calculated by this grouping. The tiny dataset is then returned, writing to the current working directory named tinyData.txt.

Data Source
======================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 