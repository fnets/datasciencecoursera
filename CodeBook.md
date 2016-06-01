# Code Book

An explaination of the variables and methods used in "TidyData.txt"

##Data
This [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was taken by students at [UC-Irvine](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  It contains exercise activity data collected
from the accelerometers in Samsung Galaxy 5's.

##Variables
- "filename": The local path of the folder containing the exercise data
- "features": The features included in the data.  Read 'features_info.txt' for more information.
- "statData": The data containing the mean and standard deviation information of the exercise data 
- "trainingData" and "testingData":  Datasets that were used to train a learning algorithm, 
	and the data that was used to test it.
- "allData" - a joined table of the training and testing data.

##Methods
- "rbind": a function that joins datatables together
- "melt": Re-arranges wide-form data into id-variable combinations.  In this case, "subject" and "activity"
- "cast": Re-arranges wide-form data into long-form data, taking a new shape.  in this case, it also calculates the mean of each value in the dataset.

##Output
- "TidyData.txt": The outputted data, arranged and managable.
