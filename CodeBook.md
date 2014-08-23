Code Book for Human Activity Recognition tidy dataset
======================================================

* Author: [Yao-Jen Chang (autekwing)](https://github.com/autekroy) 
* Email : autekwing@ucla.edu
* Date  : 08/22/2014 @Taiwan
* Verion: 1.1

===========================================

### Study design and background

I use the [Human Activity Recognition Using Smartphones Data Set.] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) This is a open data set for collecting 3-axial linear acceleration and 3-axial angular velocity when recording people's activities.

I use run_analysis.R to create a tidy data set (tidy_data_set.txt) from origianl Human Activity Recognition dataset. This tidy set followed [Getting and Cleaning Data](https://www.coursera.org/course/getdata)'s project instruction.

For more detail about project requirement, please check READ.md file.

===========================================

### Data description
This is a size 180 * 68 matix tidy data set. It's easy for you to think there are two parts.

#### First part is 1th and 2nd columns:
They are respectively extracted from subject_test.txt(subject_train.txt) and Y_test.txt(Y_train.txt).
In addition, I map the activity_labels.txt to test,txt data for real activities' names.

We have **6 activities** and **30 volunteers**, and everyone have their own activities. So we have 180 (6 * 30) distinct observations for each variavle.

#### Second part is 3th to 68th columns:
They are extracted from X_test.txt(X_train.txt), and the columns' name exactly match the feature.txt file.
Follow the project's reqirement, these columns are the mean and standard deviation for each measurement.

There're 66 variable ended mean() and std() in original dataset. For example, tBodyGyroMag-mean() and tBodyGyroMag-std().

I don't include features like "fBodyAcc-meanFreq()-X" because I think mean frequency is like above features. Therefore, I neglect these few features.

Then I calcuate **the average of each vaiable for each activity and each subject.**

If you want the more detailed about origianl features, please check **_feature.txt and feature_info.txt_** in original dataset.

===========================================

### Variable description
* 1th column(activities): including "lay", "sit", "stand", "walk", "walk_downstairs" and "walk_upstairs" in order
* 2th column(subject): number 1 to 30, representing the number of volunteers
* 3th - 68th column: they are close meaning to origianl features' names. I extract some paragraphs of feature_info.txt to explain these variables.

#### Explain 3th-68th variables:
The dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Also, acceleration signal was then separated into body and gravity acceleration signals (**_tBodyAcc-XYZ and tGravityAcc-XYZ_**)

the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**_tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ_**). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**_tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag_**). 

Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing **_fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag._** (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Last, each variable have ended on mean()(Mean value) or std()(Standard deviation) to estimate from above signals.

Finally, in the tidy data set, each variable represent the **_arerage_** of all signals(each variable). So I have change the variable names to "aver_of_**aboveVariableName**_" to indicate average of each variable.

===========================================

### Notes: 
* Features are normalized and bounded within [-1,1].
* hough the 3th-68th columns' names are the same of original features', they have different meaning. They are _average of each vaiable(mean)_, istead of original features.
* If you want the more detailed about origianl features, please check **_feature.txt and feature_info.txt_** in original dataset.


