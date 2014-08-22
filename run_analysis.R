# # =========================================================== #
# Author: Yao-Jen Chang (autekwing) (https://github.com/autekroy)
# Email : autekwing@ucla.edu
# Date  : 08/22/2014 @Taiwan
# Verion: 1.0
# # =========================================================== #

# set working directory if you need, the following is my computers'
#setwd("Coursera/Getting and Cleaning Data/project/UCI HAR Dataset")

# load the data and features' name to memory
testSet <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/Y_test.txt")
testSub <- read.table("./test/subject_test.txt")

trainSet <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/Y_train.txt")
trainSub <- read.table("./train/subject_train.txt")

feaName <- read.table("./features.txt")
feaName <- feaName[2]

# check data's dimention
dim(testSet);     dim(testLabel);     dim(testSub)
dim(trainSet);    dim(trainLabel);    dim(trainSub)

# ===step 1. Merges the training and the test sets===
# first merge the test and train data data
# so the three data(X, Y, subject) will have same number of rows
merSet   <- rbind(testSet, trainSet)
merLabel <- rbind(testLabel, trainLabel)
merSub   <- rbind(testSub, trainSub)


# ===step 4. labels the data set with descriptive variable names.===
## I do the step 4 before step 2 (extracting data)
## because it's easier to map features' names before subsetting them.
# transpose the matrix from row to column
feaName <- t(feaName)

# change the merged data sets's columns' name into real features' names
colnames(merSet) <- feaName #map the feature name to 


# ===step 2. Extracts only the measurements on mean() and std()===
extrSet <- merSet[ c(1:6, 41:46, 81:86, 121:126, 161:166,
                    201, 202, 214, 215, 227, 228, 240, 241,
                    253, 254, 266:271, 345:350, 424:429,
                    503, 514, 516, 517, 529, 530, 542, 543)]

# ===step 3.Uses descriptive names to name the activities in the data set===
merAct <- factor(merLabel[,1], labels = c("walk", "walk_upstairs", "walk_downstairs", "sit","stand", "lay"))
merAct <- as.character(merAct) # convert factor to character vector
merAct <- data.frame(merAct)   # conver vector to data frame
colnames(merAct) <- "activity" # change the column's name

# conbine above extracted data with activities
extrSet <- cbind(extrSet, merAct)

# ===step 5. Creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. ===
colnames(merSub) <- "subject"
extrSet <- cbind(extrSet, merSub)

library(reshape2)
# set all 66 variables
setMelt <- melt(extrSet, measure.vars = names(extrSet[1:66]))
# for each activity and subject, calculate mean for each variable
tidyData <- dcast(setMelt, activity + subject ~ variable, mean)

# create a tidy data set file
write.table(tidyData, file = "./tidy_data_set.txt", row.name=FALSE)

# test for reading tidy set file
# set check.names = FALSE ensures the colums names stay same in file
newTidyData <- read.table("./tidy_data_set.txt")
