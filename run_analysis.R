# Load dplyr package
library(dplyr)

# Create the dataframes to store activity labels (WALKING, WALKING_UPSTAIRS, ...) and feeature labels (tBodyAcc-mean()-X, tBodyAcc-mean()-Y, ...).
activitylabels <- data.frame(read.delim("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = ""))
featureslabels <- data.frame(read.delim("UCI HAR Dataset/features.txt", header = FALSE, sep = ""))
activitylabels$V2 <- tolower(activitylabels$V2)

# Read the train data. subjectstest stores the subjects, featurestest - the features, and labelstest - labels.
subjectstrain <- data.frame(read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = ""))
featurestrain <- data.frame(read.delim("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = ""))
labelstrain <- data.frame(read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = ""))

# Read the analogous data for training.
subjectstest <- data.frame(read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = ""))
featurestest <- data.frame(read.delim("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", colClasses = "numeric"))
labelstest <- data.frame(read.delim("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = ""))

# Merge the train and test data.
subjects <- rbind(subjectstrain, subjectstest)
features <- rbind(featurestrain, featurestest)
labels <- rbind(labelstrain, labelstest)

# Set descriptive variable names.
colnames(subjects) <- c("subject")
colnames(features) <- featureslabels[, 2]
colnames(labels) <- c("activity")

# Extract only the mean and standard deviation for each measurement in the features dataframe
featuresextracted <- data.frame(features$`tBodyAcc-mean()-X`, features$`tBodyAcc-mean()-Y`, features$`tBodyAcc-mean()-Z`, features$`tBodyAcc-std()-X`, features$`tBodyAcc-std()-Y`, features$`tBodyAcc-std()-Z`, features$`tGravityAcc-mean()-X`, features$`tGravityAcc-mean()-Y`, features$`tGravityAcc-mean()-Z`, features$`tGravityAcc-std()-X`, features$`tGravityAcc-std()-Y`, features$`tGravityAcc-std()-Z`, features$`tBodyAccJerk-mean()-X`, features$`tBodyAccJerk-mean()-Y`, features$`tBodyAccJerk-mean()-Z`, features$`tBodyAccJerk-std()-X`, features$`tBodyAccJerk-std()-Y`, features$`tBodyAccJerk-std()-Z`, features$`tBodyGyro-mean()-X`, features$`tBodyGyro-mean()-Y`, features$`tBodyGyro-mean()-Z`, features$`tBodyGyro-std()-X`, features$`tBodyGyro-std()-Y`, features$`tBodyGyro-std()-Z`, features$`tBodyGyroJerk-mean()-X`, features$`tBodyGyroJerk-mean()-Y`, features$`tBodyGyroJerk-mean()-Z`, features$`tBodyGyroJerk-std()-X`, features$`tBodyGyroJerk-std()-Y`, features$`tBodyGyroJerk-std()-Z`, features$`tBodyAccMag-mean()`, features$`tBodyAccMag-std()`, features$`tGravityAccMag-mean()`, features$`tGravityAccMag-std()`, features$`tBodyAccJerkMag-mean()`, features$`tBodyAccJerkMag-std()`, features$`tBodyGyroMag-mean()`, features$`tBodyGyroMag-std()`, features$`tBodyGyroJerkMag-mean()`, features$`tBodyGyroJerkMag-std()`, features$`fBodyAcc-mean()-X`, features$`fBodyAcc-mean()-Y`, features$`fBodyAcc-mean()-Z`, features$`fBodyAcc-std()-X`, features$`fBodyAcc-std()-Y`, features$`fBodyAcc-std()-Z`, features$`fBodyAccJerk-mean()-X`, features$`fBodyAccJerk-mean()-Y`, features$`fBodyAccJerk-mean()-Z`, features$`fBodyAccJerk-std()-X`, features$`fBodyAccJerk-std()-Y`, features$`fBodyAccJerk-std()-Z`, features$`fBodyGyro-mean()-X`, features$`fBodyGyro-mean()-Y`, features$`fBodyGyro-mean()-Z`, features$`fBodyGyro-std()-X`, features$`fBodyGyro-std()-Y`, features$`fBodyGyro-std()-Z`, features$`fBodyAccMag-mean()`, features$`fBodyAccMag-std()`, features$`fBodyBodyAccJerkMag-mean()`, features$`fBodyBodyAccJerkMag-std()`, features$`fBodyBodyGyroMag-mean()`, features$`fBodyBodyGyroMag-std()`, features$`fBodyBodyGyroJerkMag-mean()`, features$`fBodyBodyGyroJerkMag-std()`, features$`angle(tBodyAccMean,gravity)`, features$`angle(tBodyAccJerkMean),gravityMean)`, features$`angle(tBodyGyroMean,gravityMean)`, features$`angle(tBodyGyroJerkMean,gravityMean)`, features$`angle(X,gravityMean)`, features$`angle(Y,gravityMean)`, features$`angle(Z,gravityMean)`)

# Set descriptive columnn names for feeaturesextracted
colnames(featuresextracted) <- c("tbodyaccmeanx", "tbodyaccmeany", "tbodyaccmeanz", "tbodyaccstdx", "tbodyaccstdy", "tbodyaccstdz", "tgravityaccmeanx", "tgravityaccmeany", "tgravityaccmeanz", "tgravityaccstdx", "tgravityaccstdy", "tgraivtyaccstdz", "tbodyaccjerkmeanx", "tbodyaccjerkmeany", "tbodyaccjerkmeanz", "tbodyaccjerkstdx", "tbodyaccjerkstdy", "tbodyaccjerkstdz", "tbodygyromeanx", "tbodygyromeany", "tbodygyromeanz", "tbodygyrostdx", "tbodygyrostdy", "tbodygyrostdz", "tbodygyrojerkmeanx", "tbodygyrojerkmeany", "tbodygyrojerkmeanz", "tbodygyrojerkstdx", "tbodygyrojerkstdy", "tbodygyrojerkstdz", "tbodyaccmagmean", "tbodyaccmagstd", "tgravityaccmagmean", "tgravityaccmagstd", "tbodyaccjerkmagmean", "tbodyaccjerkmagstd", "tbodygyromagmean", "tbodygyromagstd", "tbodygyrojerkmagmean", "tbodygyrojerkmagstd", "fbodyaccmeanx", "fbodyaccmeany", "fbodyaccmeanz", "fbodyaccstdx", "fbodyaccstdy", "fbodyaccstdz", "fbodyaccjerkmeanx", "fbodyaccjerkmeany", "fbodyaccjerkmeanz", "fbodyaccjerkstdx", "fbodyaccjerkstdy", "fbodyaccjerkstdz", "fbodygyromeanx", "fbodygyromeany", "fbodygyromeanz", "fbodygyrostdx", "fbodygyrostdy", "fbodygyrostdz", "fbodyaccmagmean", "fbodyaccmagstd", "fbodybodyaccjerkmagmean", "fbodybodyaccjerkmagstd", "fbodybodygyromagmean", "fbodybodygyromagstd", "fbodybodygyrojerkmagmean", "fbodybodygyrojerkmagstd", "angletbodyaccmeangravity", "angletbodyaccjerkmeangravitymean", "angletbodygyromeangravitymean", "angletbodygyrojerkmeangravitymean", "anglexgravitymean", "angleygravitymean", "anglezgravitymean")

# Use descriptive names for activities
labels <- apply(labels, MARGIN = 1, FUN = function(x) activitylabels[x, 2])

# Form tidy dataset
tidydataset <- cbind(subjects, featuresextracted, labels)
names(tidydataset)[names(tidydataset) == "subjects"] <- "subject"
names(tidydataset)[names(tidydataset) == "labels"] <- "activity"

# Find means of each variable by activity and subject
tidybyactivity <- tidydataset %>% group_by(activity) %>% summarise_at(vars(tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz, tbodyaccstdx, tbodyaccstdy, tbodyaccstdz, tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz, tgravityaccstdx, tgravityaccstdy, tgraivtyaccstdz, tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz, tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz, tbodygyromeanx, tbodygyromeany, tbodygyromeanz, tbodygyrostdx, tbodygyrostdy, tbodygyrostdz, tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz, tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz, tbodyaccmagmean, tbodyaccmagstd, tgravityaccmagmean, tgravityaccmagstd, tbodyaccjerkmagmean, tbodyaccjerkmagstd, tbodygyromagmean, tbodygyromagstd, tbodygyrojerkmagmean, tbodygyrojerkmagstd, fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz, fbodyaccstdx, fbodyaccstdy, fbodyaccstdz, fbodyaccjerkmeanx, fbodyaccjerkmeany, fbodyaccjerkmeanz, fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz, fbodygyromeanx, fbodygyromeany, fbodygyromeanz, fbodygyrostdx, fbodygyrostdy, fbodygyrostdz, fbodyaccmagmean, fbodyaccmagstd, fbodybodyaccjerkmagmean, fbodybodyaccjerkmagstd, fbodybodygyromagmean, fbodybodygyromagstd, fbodybodygyrojerkmagmean, fbodybodygyrojerkmagstd, angletbodyaccmeangravity, angletbodyaccjerkmeangravitymean, angletbodygyromeangravitymean, angletbodygyrojerkmeangravitymean, anglexgravitymean, angleygravitymean, anglezgravitymean),
                                                                      list(mean = mean))
tidybysubject <- tidydataset %>% group_by(subject) %>% summarise_at(vars(tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz, tbodyaccstdx, tbodyaccstdy, tbodyaccstdz, tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz, tgravityaccstdx, tgravityaccstdy, tgraivtyaccstdz, tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz, tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz, tbodygyromeanx, tbodygyromeany, tbodygyromeanz, tbodygyrostdx, tbodygyrostdy, tbodygyrostdz, tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz, tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz, tbodyaccmagmean, tbodyaccmagstd, tgravityaccmagmean, tgravityaccmagstd, tbodyaccjerkmagmean, tbodyaccjerkmagstd, tbodygyromagmean, tbodygyromagstd, tbodygyrojerkmagmean, tbodygyrojerkmagstd, fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz, fbodyaccstdx, fbodyaccstdy, fbodyaccstdz, fbodyaccjerkmeanx, fbodyaccjerkmeany, fbodyaccjerkmeanz, fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz, fbodygyromeanx, fbodygyromeany, fbodygyromeanz, fbodygyrostdx, fbodygyrostdy, fbodygyrostdz, fbodyaccmagmean, fbodyaccmagstd, fbodybodyaccjerkmagmean, fbodybodyaccjerkmagstd, fbodybodygyromagmean, fbodybodygyromagstd, fbodybodygyrojerkmagmean, fbodybodygyrojerkmagstd, angletbodyaccmeangravity, angletbodyaccjerkmeangravitymean, angletbodygyromeangravitymean, angletbodygyrojerkmeangravitymean, anglexgravitymean, angleygravitymean, anglezgravitymean),
                                                                      list(mean = mean))

# Write datasets to files
write.table(tidydataset, "tidydataset.txt", sep = "\t", quote = FALSE)
write.table(tidybyactivity, "tidybyactivity.txt", sep = "\t", quote = FALSE)
write.table(tidybysubject, "tidybysubject.txt", sep = "\t", quote = FALSE)