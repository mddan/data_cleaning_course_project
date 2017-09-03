# Final course project for Coursera course: 'Getting and Cleaning Data'

## Contents of this repository

- 'README.md' : Overview of the project, analysis files and relevant data sets.

- 'run_analysis.R' : R script which extracts and transforms the analysis files to create the tidy data set.

- 'tidydata.txt' : Final output data set which is created by the R script.

- 'CodeBook.md' : Code book which describes the variables, data, and transformations performed to generate the final tidy dataset.

## Purpose (as per Coursera)

The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis. Grading is done by peers on a series of yes/no questions related to the project. Student is required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## General background (as per Coursera)

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Source of the data 

Original data used in this project can be found at this link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Study design: what was done, how the data was obtained

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the study team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. These details can be found in 'features_info.txt' from the original data.

## Creating the tidy dataset

 The R script named 'run_analysis.R' creates the tidy dataset by performing the following operations:

 - Download and extract all relevant data to an existant or, if necessary, newly created directory.
 - Read relevant data files.
 - Merge training data set and test data set.
 - Extract exclusively the measurements on the mean and standard deviation for each measurement.
 - Relabel the activities in the merged data set with descriptive activity names.
 - Clean the feature names to be more clear in the merged dataset
 - Create a second, tidy, data set which aggregates the average of each variable by activity and subject.
 - Write this tidy data set to 'tidydata.txt' file.

Further details of these operations and transformations can be found the the Code book and in the comments imbedded within the script.
