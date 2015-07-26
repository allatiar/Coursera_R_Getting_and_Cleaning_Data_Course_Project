library(dplyr)

createTidyDataset <- function() {
  #read test data
  subject_test <-
    read.table(file = "UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
  
  #read train data
  subject_train <-
    read.table(file = "UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
  
  #labels with descriptive variables names
  features <- read.table("UCI HAR Dataset/features.txt")
  colnames(X_test) <- features$V2
  colnames(X_train) <- features$V2
  colnames(subject_test) <- c("subject")
  colnames(subject_train) <- c("subject")
  
  #Extracts only the measurements on the mean and standard deviation
  X_test <-
    X_test[,grep(pattern = "mean\\(\\)|std\\(\\)", x = colnames(X_test), value = FALSE)]
  X_train <-
    X_train[,grep(pattern = "mean\\(\\)|std\\(\\)", x = colnames(X_train), value = FALSE)]
  
  #use descriptive activity names for activities y
  activity_labels <-
    read.table("UCI HAR Dataset/activity_labels.txt")
  colnames(activity_labels) <- c("activity_id", "activity")
  colnames(Y_test) <- c("activity_id")
  colnames(Y_train) <- c("activity_id")
  Y_test <-
    merge(x = Y_test, y = activity_labels) %>% select(activity)
  Y_train <-
    merge(x = Y_train, y = activity_labels) %>% select(activity)
  
  #create test and training sets
  test <- data.frame(subject_test, Y_test, X_test)
  colnames(test) <- c(colnames(subject_test), colnames(Y_test), colnames(X_test))
  train <- data.frame(subject_train, Y_train, X_train)
  colnames(train) <- c(colnames(subject_test), colnames(Y_test), colnames(X_test))
  
  # merge into one dataset
  rbind(test, train)
}

# create independant dataset with the average of each variable for each activity and each subject.
createMeanDatasetBySubjectAndActivity <- function(dataset) {
  group_by(.data = dataset, subject, activity)  %>% summarise_each(funs = funs(mean))
}

# write data set as txt file
writeDatasetToTxt <- function(dataset) {
  write.table(dataset, file= "output.txt", row.names = FALSE)
}

tidyDataset <- createTidyDataset()
meanDataset <- createMeanDatasetBySubjectAndActivity(tidyDataset)
writeDatasetToTxt(meanDataset)


