# Getting and Cleaning Wearable Exercise Data

##This is a coding project from the [Getting and Cleaning Data Coursera course.](https://www.coursera.org/learn/data-cleaning/home/welcome)
###The purpose is to create an human readable and consice version of the wearable [large dataset provided](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The algorithm is as follows:

1. Locates local dataset (you'll have to replace the path with your own)
2. Loads the feature data
3. Extracts the standard deviation and mean from the testing training data, and adds labels
4. Then merges into single dataset
5. Converts the `activity` and `subject` data into factors, so that they may be melted as wide-format dataset
6. Creates a long-format dataset (otherwise known as a "tidy dataset") that arranges each subject and
   exercise to the proper men value.  It's a bit of a cheat, I know.
7. Finally, outputs dataset as "TidyData.txt"
