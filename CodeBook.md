# Codebook
This codebook will explain the datasets available.

### Source
data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Description of dataset

The data involves an experiment perfomed on 30 volunteers within the age of 19-48. For each person the following activities were tabulated: walking, walking_upstairs, walking_downstairs, sitting,
standing, laying. This was done using a smarpthone (Samsung Galaxy S II). Using an embedded accelerometer and gyroscope, 3 axial linear acceleration and 3-axial angular velocity were captured at a constant rate 
of 50Hz. The experiments have also been video recorded to label the data manually. The obtained dataset has been randomly partitioned into training and test set with a 70-30 split.
For pre-processing, noise filters were used on the sensor signals and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap. The sensor acceleration signal, which has gravitational and body
motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Data
The dataset includes the following files:
*Item "README.txt"
*Item "features_info.txt": Shows information about the variables used on the feature vector
*Item "features.txt": List of all features
*Item "activity_labels.txt": connects the class labels to the corresponding activity
*Item 'train/X_train.txt": Training set
*Item 'train/Y_train.txt": Training labels
*Item 'test/X_test.txt": Testing set
*Item 'train/Y_test.txt": Testing labels
*Item 'train/subject_train.txt": Identifies subject who performed activity for training set
*Item 'test/subject_test.txt": Identififes subject who performed activity for testing set

## Transformation
There are 5 parts:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

"run_analysis.R" performs the above steps as follows:
1. importing the training, test sets with their respective labels. As well as activity labels.
2. Extracts the mean and standard deviation for each measurement
3. merges the training set and testing set with their labels
4. merges the training data and testing data
