Tidy-Data-Set-of-Human-Activity-Recognition
===========================================

* Author: [Yao-Jen Chang (autekwing)](https://github.com/autekroy) 
* Email : autekwing@ucla.edu
* Date  : 08/22/2014 @Taiwan
* Verion: 1.0

===========================================
### Background and Source
This is the course project of [Getting and Cleaning Data](https://www.coursera.org/course/getdata). (Provided from John Hopkins University in Coursera) I use the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to create a tidy data set for future analysis.

This data set captures 3-axial linear acceleration and 3-axial angular velocity at 50 Hz with labeled with human activities, which are WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING and LAYING.

===========================================
### Processed steps in R scripts (project requirements)
I use R programming language to create this tidy data set. 
My processed stpes meet the course project requirement including:
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

My R script is based on above steps. There are more detailed command in R file to explain my every step.

===========================================
### This repo includes the following files
* [README.md](https://github.com/autekroy/Tidy-Data-Set-of-Human-Activity-Recognition/blob/master/README.md)
* [run_analysis.R](https://github.com/autekroy/Tidy-Data-Set-of-Human-Activity-Recognition/blob/master/run_analysis.R) : main script to process original data and create final tidy data set
* [CodeBook.md](https://github.com/autekroy/Tidy-Data-Set-of-Human-Activity-Recognition/blob/master/CodeBook.md) : describes the variables and data
* [tidy_data_set](https://github.com/autekroy/Tidy-Data-Set-of-Human-Activity-Recognition/blob/master/tidy_data_set.txt) : my created tidy data set

===========================================
### Reproduce tidy dataset stpes
* 1. Download the original Human Activity Recognition data folder from [UCI HAR Dataset.zip] (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)
* 2. unzip "UCI HAR Dataset.zip" to appropriate directory
* 3. place run_analysis.R in "UCI HAR Dataset" folder
* 4. run run_analysis.R steps by steps to see what happend
* 5. reproduce the "tidy_data_set.txt" file

You shold carefully set the appropriate directory. You can check run_analysis.R. The setwd() and read.table()'s path to understand how it works.


