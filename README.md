# README.md #
## Human Activity Recognition Using Smartphones Data Set ##
### Subset of data taken for Coursera "Getting Data" coursework exercise

Author: Mark Riseley

Date: 21 December 2014

This repo contains three files:

* **README.md**: describes the dataset at a high level, and explains the analysis process and annotates the script operations.
* **run\_analysis.R**: an R script for performing data extraction and analysis
* **CodeBook.md**: a markdown file describing the final dataset variables and the transformations applied from the source data

###About the source dataset###

The data derived comes from experiments on a small number of volunteers who have had various activities measured by sensors on a smartphone. Here is an excerpt from the description on the relevant [UCI webpage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Original source of the study data: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

Please find the original dataset, description files and README on its [UCI page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), in order to familiarize yourself with the goals, context and full dataset from which I have derived this dataset.

The source dataset contains the following files which were used here ("inertial" files containing raw data were not required)

* features.txt: the original observation variable names. These are described in features_info.txt
* activity\_labels.txt: a look-up table of activity IDs (1-6) and their corresponding names (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)
* test/subject_test.txt: the ID of the subject for each row of the set of observations on the variables in the test data set
* test/y\_test.txt: the activity ID of each row of the set of observations on the variables in the test data set
* test/x\_test.txt: the set of observations of 561 measurement variables for all subjects & activities
* train/subject\_train.txt; train/y\_train.txt; train/x\_train.txt: these 3 files equivalent to the test files for the training portion of the dataset.

This [visualization - viewable by Coursera class participants](https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333) - from Community TA David Hood should also make clear how the files fit together.

###Analysis overview###

The analysis instructions (taken from the course assignment description) were as follows:

> You should create one R script called run_analysis.R that does the following.
>
> 1. Merges the training and the test sets to create one data set.
>
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
>
> 3. Uses descriptive activity names to name the activities in the data set
>
> 4. Appropriately labels the data set with descriptive variable names. 
>
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

###Analysis procedures###

Below is how the data has been captured and processed with respect to the original dataset.

Using an R script **run_analysis.R**, the following procedures were performed:

**Reading in and clipping together data and labels**

* Downloaded the dataset from the UCI site using this [link](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)
* Unzipped the file into a folder "UCI HAR Dataset" in the working directory containing all the relevant data and description files
* Read in the observation variable names from features.txt, the activity labels from activity\_labels.txt
* Read in subject IDs for test and train observation datasets from subject\_test.txt / subject\_train.txt
* Read in activity IDs for test and train observation datasets from y\_test.txt / y\_train.txt
* Read in observations dataset from x\_test / x\_train
* Attached observation variable names from features.txt to x\_test/x\_train dataframes
* Clipped together the subject and activity IDs to the observation datasets for each of test / train
* Appended the train dataset on the end of the test dataset to create a full dataset (data_all) of 10299 observations of 563 variables; the variables being subject, activity and the 561 measurement variables from x\_test / x\_train
* Converted activity ID (numbers 1-6) to a factor variable using the labels from activity_labels.txt

**Subsetting variables relating to the mean and standard deviation of different measurement variables**

* Created a list of the variables of interest for further processing - those relating to the mean or standard deviation of a measurement variable. This was done using a regular expression to find all variables whose names contain exactly the phrases "mean()", or "std()". There are some variables which contain the word "mean" in but are not strictly themselves means of observations so were excluded from the selection. Example: 'fBodyGyro-meanFreq()-X'. This resulted in 68 variables (subject, activity & 66 variables containing "mean()" or "std()").
* Subsetted the full dataset (data\_all) by the above list
* Tidied up variable names to remove punctuation and conform to camel case. Note the first letter prefix of each variable relates to either time (t) or frequency (f) related observations. The variable names were starting to get rather long so I have not expanded these.

**Creating a new dataset with the average of all of the measurement variables by subject by activity**

* Melted the data into long thin form (subject, activity, variable, value)
* recast the data into tidy wide form and summarizing the mean of each variable's value by subject by activity (=30*6 rows)

**Write the data out to a txt file**

* Using write.table, row.names=FALSE, wrote "tidydata.txt". To read in, please use 'read.table("tidydata.txt",header=TRUE)'

### The resulting output ###
"tidydata.txt" ultimately contains for each subject and each activity, the mean of each of the measurement variables which were themselves either the mean or the standard deviation of a particular measurement type. To put it another way, the final data contains either means of means, or means of standard deviations. This data set is therefore 180 rows of observations (30 subjects x 6 activities) on 66 measurement variables (ie total dimension is 180 rows x 68 cols).

Details of the variables can be found in the accompanying codebook.md document in this repo.

------
**Environment used to generate analysis**

R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"

Platform: x86_64-w64-mingw32/x64 (64-bit)

OS: Windows 8.1

R packages:

* data.table v1.9.4
* reshape2 v1.4.1


