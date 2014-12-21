## Coursera - getting data course project

## Packages to load
require(data.table); require(reshape2)

## Download & extract file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
myFile <- "UCI_HAR_Dataset.zip"
download.file(fileUrl, destfile=myFile)
dateDownloaded <- date()

if(!file.exists("UCI HAR Dataset")) {dataFolder <- unzip(myFile)}
dataFolder <- "./UCI HAR Dataset/"

## Read in variable names
featuresVarNames <- read.table(paste0(dataFolder,"features.txt"), row.names=1, sep="", 
                                quote="", stringsAsFactors = FALSE, 
                                colClasses = "character")
## Read in activity labels
activityLabels <- read.table(paste0(dataFolder, "activity_labels.txt"),
                             col.names=c("activityID", "activity"))
## Read in subject IDs for test & train observations
subject_test <- read.table(paste0(dataFolder,"test/subject_test.txt"),
                           col.names="subject")
subject_train <- read.table(paste0(dataFolder,"train/subject_train.txt")
                            ,col.names="subject")
## Read in activity IDs for test & train observations
activity_test <- read.table(paste0(dataFolder, "test/y_test.txt"),
                            col.names="activity")
activity_train <- read.table(paste0(dataFolder, "train/y_train.txt"),
                             col.names="activity")

## Read in observations dataset from x_test / x_train
x_test <- read.table(paste0(dataFolder,"test/x_test.txt"), colClasses = "numeric")
x_train <- read.table(paste0(dataFolder,"train/x_train.txt"), colClasses = "numeric")

## Attach observation variable names from features.txt to x_test/x_train dataframes
setnames(x_test, old = names(x_test), new=featuresVarNames[,1])
setnames(x_train, old = names(x_train), new=featuresVarNames[,1])

## To create a marker of test / train groups in dataset, uncomment next 2 lines
## subject_test <- subject_test[,modelGroup:="test"]
## subject_train <- subject_train[,modelGroup:="train"]

## Add subject ID and activity type for observations in datasets, convert to DT
tmp_test <- as.data.table(cbind(subject_test, activity_test, x_test))
tmp_train <- as.data.table(cbind(subject_train, activity_train, x_train))

## Merge the two dataframes
data_all <- rbind(tmp_test, tmp_train)

## convert activity IDs to factor levels sourced from activity_labels.txt
data_all[,activity:=factor(activity, labels = activityLabels$activity)]

## Create a list of subject, activity and the required variables
  ## Subset only variables relating to measures of mean() or std() 
  ## NB "\\<..\\>" identifies the start and end of a "word" in regexes
  ## ... used to avoid matching on "mean....()" as it would match on 
  ## "fBodyGyro-meanFreq()-X" which we want to exclude
varsList <- c("subject","activity",grep("\\<mean()\\>|\\<std()\\>", 
                     names(data_all), value=TRUE))
## Create a subset selecting variable names in varsList. NB "with=FALSE" 
## means look up 'varsList' outside the data table (ie don't look for col name)
dataVars <- data_all[,varsList, with=FALSE]
## Create tidy variable names
namesTmp <- names(dataVars) 
namesTmp <- gsub("BodyBody", "Body", namesTmp) ## fix typo
namesTmp <- gsub("mean", "Mean", namesTmp) ## camel case
namesTmp <- gsub("std", "Std", namesTmp) ## camel case
namesTmp <- gsub("[[:punct:]]", "", namesTmp) ## strip punctuation '-,.()'
setnames(dataVars,names(dataVars),namesTmp)

## Create a dataset that has the average of each variable,
## for each activity and each subject
  ## Melt to long/thin form to make grouped analysis easier
DT <- melt(dataVars, id.vars=c("subject","activity"))
  ## recast to wide form, taking the mean for each variable per subject/activity
tidyDF <- dcast(DT, subject+activity ~ variable, mean)

write.table(tidyDF, "tidydata.txt", row.names=FALSE)
## NB when reading table back in 'read.table("tidydata.txt", header=TRUE)', 
## original levels order for activities as per authors' coding is not preserved. 
## However the order of activity levels isn't important or significant.



