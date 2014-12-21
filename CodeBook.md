## Codebook for data analysis resulting in "tidydata.txt"##
### Author: Mark Riseley ###

Last updated 21 December 2014

The original dataset, before manipulation, comes from this [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

You can read more about the context and data processing in README.md

The output data consists of a text file data table of 180 rows and 68 columns.

The first two variables are:
subject: This is the ID of the participant, an integer ranging from 1 to 30
activity: This is the type of activity being measured. It's a factor variable with the options(WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) representing the activities being performed by the participants when being recorded by the smartphone instrumentation.

The remaining 66 variables are listed below. These have been renamed to avoid use of punctuation marks in variable names which forces character escaping in some situations. Details of the renaming procedures are in the README.md file or you can simply view the results in the table below.

The source variables are in fact already summary variables of sets of observations of motion & inertia sensors on phones. Without domain expertise it is not easy to summarize exactly what each measurement refers to, but the full documentation can be found within the features_info.txt file when downloading the dataset from the [UCI site](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).

This codebook will concentrate on describing the transformations from the original source data, so correct interpretation can be made of the new processed data set, if the reader is familiar with the original documentation.

Below are the names of the 66 calculated variables. They each comprise of a mean value of all of the values of a particular type of observation for a given combination of subject and activity.

*For example 'tBodyAccMeanX' for (subject=1 & activity=walking) is the mean of the 95 observations of the original variable 'tBodyAcc-mean()-X'.*

These original variables were normalized to between 1 and -1, and were themselves means or standard deviations of a set of measurements.

Measurement variables outputted in "tidydata.txt"

    	  	  Variable name          Derived from (in source data, from features.txt)
	1         tBodyAccMeanX           tBodyAcc-mean()-X
	2         tBodyAccMeanY           tBodyAcc-mean()-Y
	3         tBodyAccMeanZ           tBodyAcc-mean()-Z
	4          tBodyAccStdX            tBodyAcc-std()-X
	5          tBodyAccStdY            tBodyAcc-std()-Y
	6          tBodyAccStdZ            tBodyAcc-std()-Z
	7      tGravityAccMeanX        tGravityAcc-mean()-X
	8      tGravityAccMeanY        tGravityAcc-mean()-Y
	9      tGravityAccMeanZ        tGravityAcc-mean()-Z
	10      tGravityAccStdX         tGravityAcc-std()-X
	11      tGravityAccStdY         tGravityAcc-std()-Y
	12      tGravityAccStdZ         tGravityAcc-std()-Z
	13    tBodyAccJerkMeanX       tBodyAccJerk-mean()-X
	14    tBodyAccJerkMeanY       tBodyAccJerk-mean()-Y
	15    tBodyAccJerkMeanZ       tBodyAccJerk-mean()-Z
	16     tBodyAccJerkStdX        tBodyAccJerk-std()-X
	17     tBodyAccJerkStdY        tBodyAccJerk-std()-Y
	18     tBodyAccJerkStdZ        tBodyAccJerk-std()-Z
	19       tBodyGyroMeanX          tBodyGyro-mean()-X
	20       tBodyGyroMeanY          tBodyGyro-mean()-Y
	21       tBodyGyroMeanZ          tBodyGyro-mean()-Z
	22        tBodyGyroStdX           tBodyGyro-std()-X
	23        tBodyGyroStdY           tBodyGyro-std()-Y
	24        tBodyGyroStdZ           tBodyGyro-std()-Z
	25   tBodyGyroJerkMeanX      tBodyGyroJerk-mean()-X
	26   tBodyGyroJerkMeanY      tBodyGyroJerk-mean()-Y
	27   tBodyGyroJerkMeanZ      tBodyGyroJerk-mean()-Z
	28    tBodyGyroJerkStdX       tBodyGyroJerk-std()-X
	29    tBodyGyroJerkStdY       tBodyGyroJerk-std()-Y
	30    tBodyGyroJerkStdZ       tBodyGyroJerk-std()-Z
	31      tBodyAccMagMean          tBodyAccMag-mean()
	32       tBodyAccMagStd           tBodyAccMag-std()
	33   tGravityAccMagMean       tGravityAccMag-mean()
	34    tGravityAccMagStd        tGravityAccMag-std()
	35  tBodyAccJerkMagMean      tBodyAccJerkMag-mean()
	36   tBodyAccJerkMagStd       tBodyAccJerkMag-std()
	37     tBodyGyroMagMean         tBodyGyroMag-mean()
	38      tBodyGyroMagStd          tBodyGyroMag-std()
	39 tBodyGyroJerkMagMean     tBodyGyroJerkMag-mean()
	40  tBodyGyroJerkMagStd      tBodyGyroJerkMag-std()
	41        fBodyAccMeanX           fBodyAcc-mean()-X
	42        fBodyAccMeanY           fBodyAcc-mean()-Y
	43        fBodyAccMeanZ           fBodyAcc-mean()-Z
	44         fBodyAccStdX            fBodyAcc-std()-X
	45         fBodyAccStdY            fBodyAcc-std()-Y
	46         fBodyAccStdZ            fBodyAcc-std()-Z
	47    fBodyAccJerkMeanX       fBodyAccJerk-mean()-X
	48    fBodyAccJerkMeanY       fBodyAccJerk-mean()-Y
	49    fBodyAccJerkMeanZ       fBodyAccJerk-mean()-Z
	50     fBodyAccJerkStdX        fBodyAccJerk-std()-X
	51     fBodyAccJerkStdY        fBodyAccJerk-std()-Y
	52     fBodyAccJerkStdZ        fBodyAccJerk-std()-Z
	53       fBodyGyroMeanX          fBodyGyro-mean()-X
	54       fBodyGyroMeanY          fBodyGyro-mean()-Y
	55       fBodyGyroMeanZ          fBodyGyro-mean()-Z
	56        fBodyGyroStdX           fBodyGyro-std()-X
	57        fBodyGyroStdY           fBodyGyro-std()-Y
	58        fBodyGyroStdZ           fBodyGyro-std()-Z
	59      fBodyAccMagMean          fBodyAccMag-mean()
	60       fBodyAccMagStd           fBodyAccMag-std()
	61  fBodyAccJerkMagMean  fBodyBodyAccJerkMag-mean()
	62   fBodyAccJerkMagStd   fBodyBodyAccJerkMag-std()
	63     fBodyGyroMagMean     fBodyBodyGyroMag-mean()
	64      fBodyGyroMagStd      fBodyBodyGyroMag-std()
	65 fBodyGyroJerkMagMean fBodyBodyGyroJerkMag-mean()
	66  fBodyGyroJerkMagStd  fBodyBodyGyroJerkMag-std()


Original codebook entry from the UCI site is included for reference below:

>Feature Selection 
>=================
>
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

>The set of variables that were estimated from these signals are: 
>
	mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autorregresion coefficients with Burg order equal to 4
	correlation(): correlation coefficient between two signals
	maxInds(): index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): skewness of the frequency domain signal 
	kurtosis(): kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	angle(): Angle between to vectors.
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
	gravityMean
	tBodyAccMean
	tBodyAccJerkMean
	tBodyGyroMean
	tBodyGyroJerkMean
>
>The complete list of variables of each feature vector is available in 'features.txt'