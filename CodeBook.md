# Code book for final course project for Coursera course: 'Getting and Cleaning Data'

This code book serves to detail the variables, data, and relevant transformations which were performed to arrive at the final 'tidydata.txt dataset. 

## Data

The data can be found in the 'tidydata.txt' file. The first row contains the variable names. All values are seperated by spaces.

## Variables

The variables in the dataset fall under three categories; subject, activity, and feature measurements

### Subject

The 'subject' variable is an identifer variable which denotes the subject under study.
This value ranges from 1 to 30; i.e 30 subjects in total.

### Activity

The 'activity' variable is an identifier variable which denotes the activity under study.
There are six possible values for this string:

- `WALKING`: Subject walking (dynamic activity)
- `WALKING_UPSTAIRS`: Subject walking upstairs (dynamic activity)
- `WALKING_DOWNSTAIRS`: Subject walking downstairs (dynamic activity)
- `SITTING`: Subject sitting (static posture)
- `STANDING`: Subject standing (static posture)
- `LAYING`: Subject laying down (static posture)

### Feature measurements

Characteristics of the feature measurements :

- Features are normalized and bounded within [-1,1].
 
- Features measured either by two METHODS: accelerometer (units 'g's where gravity of earth = 9.80665 m/s^2) or gyroscope (units rad/s).

- The signals for each feature is used to estimate variables of the feature vector in each of the 3 axial DIRECTIONS (X, Y and Z). Therefore each feature has a X, Y, and Z component.

- Measurements have two possible CLASSIFICATIONS based on their signals; in either the time-domain (prefix time) or frequency-domain (prefix frequency

- Measurements are one of two TYPES of estimate: either average (average value of signal) or standard deviation (standard deviation of the signal)

The combinations of METHODS, DIRECTIONS, CLASSIFICATIONS, and TYPES, result in the following feature variables in the dataset:

Time-domain body acceleration; mean and standard deviation (for each X, Y, Z direction):

timeBodyAccelerometermeanX
timeBodyAccelerometermeanY
timeBodyAccelerometermeanZ
timeBodyAccelerometerstdX
timeBodyAccelerometerstdY
timeBodyAccelerometerstdZ

Time-domain gravity acceleration; mean and standard deviation (for each X, Y, Z direction):

timeGravityAccelerometermeanX
timeGravityAccelerometermeanY
timeGravityAccelerometermeanZ
timeGravityAccelerometerstdX
timeGravityAccelerometerstdY
timeGravityAccelerometerstdZ

Time-domain body acceleration jerk; mean and standard deviation (for each X, Y, Z direction):

timeBodyAccelerometerJerkmeanX
timeBodyAccelerometerJerkmeanY
timeBodyAccelerometerJerkmeanZ
timeBodyAccelerometerJerkstdX
timeBodyAccelerometerJerkstdY
timeBodyAccelerometerJerkstdZ

Time-domain body gyroscope values; mean and standard deviation (for each X, Y, Z direction):

timeBodyGyroscopemeanX
timeBodyGyroscopemeanY
timeBodyGyroscopemeanZ
timeBodyGyroscopestdX
timeBodyGyroscopestdY
timeBodyGyroscopestdZ

Time-domain body gyroscope jerk values; mean and standard deviation (for each X, Y, Z direction):

timeBodyGyroscopeJerkmeanX
timeBodyGyroscopeJerkmeanY
timeBodyGyroscopeJerkmeanZ
timeBodyGyroscopeJerkstdX
timeBodyGyroscopeJerkstdY
timeBodyGyroscopeJerkstdZ

Time-domain magnitude of body acceleration; mean and standard deviation:

timeBodyAccelerometerMagnitudemean
timeBodyAccelerometerMagnitudestd

Time-domain magnitude of gravity acceleration; mean and standard deviation:

timeGravityAccelerometerMagnitudemean
timeGravityAccelerometerMagnitudestd

Time-domain magnitude of body acceleration jerk; mean and standard deviation:

timeBodyAccelerometerJerkMagnitudemean
timeBodyAccelerometerJerkMagnitudestd

Time-domain magnitude of body gyroscope values; mean and standard deviation:

timeBodyGyroscopeMagnitudemean
timeBodyGyroscopeMagnitudestd

Time-domain magnitude of body gyroscope jerk values; mean and standard deviation:

timeBodyGyroscopeJerkMagnitudemean
timeBodyGyroscopeJerkMagnitudestd

Frequency-domain body acceleration; mean and standard deviation (for each X, Y, Z direction):

frequencyBodyAccelerometermeanX
frequencyBodyAccelerometermeanY
frequencyBodyAccelerometermeanZ
frequencyBodyAccelerometerstdX
frequencyBodyAccelerometerstdY
frequencyBodyAccelerometerstdZ

Frequency-domain body acceleration jerk; mean and standard deviation (for each X, Y, Z direction):

frequencyBodyAccelerometerJerkmeanX
frequencyBodyAccelerometerJerkmeanY
frequencyBodyAccelerometerJerkmeanZ
frequencyBodyAccelerometerJerkstdX
frequencyBodyAccelerometerJerkstdY
frequencyBodyAccelerometerJerkstdZ

Frequency-domain body gyroscope values; mean and standard deviation (for each X, Y, Z direction):

frequencyBodyGyroscopemeanX
frequencyBodyGyroscopemeanY
frequencyBodyGyroscopemeanZ
frequencyBodyGyroscopestdX
frequencyBodyGyroscopestdY
frequencyBodyGyroscopestdZ

Frequency-domain magniture body acceleration; mean and standard deviation:

frequencyBodyAccelerometerMagnitudemean
frequencyBodyAccelerometerMagnitudestd

Frequency-domain magniture body acceleration jerk; mean and standard deviation:

frequencyBodyAccelerometerJerkMagnitudemean
frequencyBodyAccelerometerJerkMagnitudestd

Frequency-domain magniture body gyroscope values; mean and standard deviation:

frequencyBodyGyroscopeMagnitudemean
frequencyBodyGyroscopeMagnitudestd

Frequency-domain magniture body gyroscope jerk values; mean and standard deviation:

frequencyBodyGyroscopeJerkMagnitudemean
frequencyBodyGyroscopeJerkMagnitudestd


## Transformations and operations

The original data for this project can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The 'run_analysis' script performs the following transformations and operations to the original data:

- Merges the test dataset and training dataset into a single dataset.

- Extracts only the measurements on the mean and standard deviation for each measurement.

- Sets the names of the activities in this extracted dataset to descriptive activity names.

- Cleans the variable names in the dataset by performing the following changes:
	a) Replace suffixes f and t with 'frequency' and 'time'
	b) Replace features portions from abbreviations to complete words (Acc -> Accelerometer, Gyro -> Gyroscope, Mag -> Magnitude)
	c) Replace BodyBody -> Body (fixes typo)
	d) Remove parentheses () from the variable names

- Creates a second, independent tidy data set with the average of each variable for each activity and each subject:




