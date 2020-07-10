---
title: "CodeBook"
author: "Raivydas Šimėnas"
date: "7/10/2020"
output: html_document
---

# CodeBook

## Data

The project manipulates the data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The original data contains the measurements obtained using smartphones in an experiment. During the experiment, 30 subjects were asked to perform certain activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), which served as labels. The smartphones recorded various physical observations, such as 3-axial linear acceleration and 3-axial angular velocity of the subjects. Training data was taken on 70% and testing data - on 30% of the subjects. The exact setup of the experiment can be found following the link above.

In our analysis, we join the training and the testing data into one dataset. Further, we only take the means and the standard deviations of the observations. We form three tidy datasets: tidydataset, tidybyactivity, and tidybysubject. In the first, we extract the means and the standard deviations of the features for each observation. In the second, we calculate the means of the means and the standard deviations of the features for each activity. In the third, we calculate the means of the means and the standard deviations of the features for each subject. 

## Files

The script stores the tidydataset and tidybyactivitysubject datasets in the files tidydataset.txt and tidybyactivitysubject.txt. The script is stored in the file run_analysis.R. In order for the script to run, the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has to be stored in the same directory as the script.

## Variables

The tidydataset dataset contains the following variables. Their names are self explanatory. The variables prefixed with 't' mean 'time domain'. The variables prefiexed with 'f' mean 'Fourier transform'. Suffixes 'mean' and 'std' denote mean and standard deviation respectively. Suffix '(xyz)' means that there are three features, one for each axis.
- subject
- tbodyaccmean(xyz)
- tbodyaccstd(xyz)
- tgravityaccmean(xyz)
- tgravityaccstd(xyz)
- tbodyaccjerkmean(xyz)
- tbodyaccjerkstd(xyz)
- tbodygyromean(xyz)
- tbodygyrostd(xyz)
- tbodygyrojerkmean(xyz)
- tbodygyrojerkstd(xyz)
- tbodyaccmagmean
- tbodyaccmagstd
- tgravityaccmagmean
- tgravityaccmagstd
- tbodyaccjerkmagmean
- tbodyaccjerkmagstd
- tbodygyromagmean
- tbodygyromagstd
- tbodygyrojerkmagmean
- tbodygyrojerkmagstd
- fbodyaccmean(xyz)
- fbodyaccstd(xyz)
- fbodyaccjerkmean(xyz)
- fbodyaccjerkstd(xyz)
- fbodygyromean(xyz)
- fbodygyrostd(xyz)
- fbodyaccmagmean
- fbodyaccmagstd
- fbodybodyaccjerkmagmean
- fbodybodyaccjerkmagstd
- fbodybodygyromagmean
- fbodybodygyromagstd
- fbodybodygyrojerkmagstd
- angletbodyaccmeangravity
- angletbodyaccjerkmeangravitymean
- angletbodygyromeangravitymean
- angletbodygyrojerkmeangravitymean
- anglexgravitymean
- angleygravitymean
- anglezgravitymean
- activity

The tidybyactivity and tidybysubject datasets contain the same variables with the respective exceptions of subject and activity.

Each variable, with the exception of subject and activity, is normalized and bounded within [-1, 1].

## Code

The code performing the analysis is contained in the file run_analysis.R. The explanation of the code is provided in the comments in this file.