library("reshape2")

filename <- "C:\\Users\\Frank\\Coursera\\Getting and Cleaning data\\data"

# Loads feature data 
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the mean and standard deviation and save as statData
statData <- grep(".*mean.*|.*std.*", features[,2]) #searches for mean and std in features
statData.names <- features[statData,2] #finds statData labels
statData.names = gsub('-mean', 'Mean', statData.names) #makes names more readable for users
statData.names = gsub('-std', 'Std', statData.names)
statData.names <- gsub('[-()]', '', statData.names)


# Loads Training Data
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt")[statData]
trainingActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingData <- cbind(trainingSubjects, trainingActivities, trainingData)

# Loads Testing Data
testingData <- read.table("UCI HAR Dataset/test/X_test.txt")[statData]
testingActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testingSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testingData <- cbind(testingSubjects, testingActivities, testingData)

#Joining Data and Creating Labels for Subject, Activity, and the statData labels
allData <- rbind(trainingData, testingData)
colnames(allData) <- c("subject", "activity", statData.names)
labels <- read.table('UCI HAR Dataset/activity_labels.txt')
labels[,2] <- as.character(labels[,2])

#Converts Activities and Subjects columns into factors, so that they may be melted
allData$activity <- factor(allData$activity, levels = labels[,1], labels = labels[,2])
allData$subject <- as.factor(allData$subject)

#"Melts" data to be "cast" in a different shape
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean) #reshapes data to organize by subjext and activities

write.table(allData.mean, "TidyData.txt", row.names = FALSE, quote = FALSE) #creates tidy table