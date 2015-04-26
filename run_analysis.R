run_analysis <- function (){
  ## Download the data files
  #fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #download.file(fileUrl, "getdata-projectfiles-UCI HAR Dataset.zip", mode="wb")
  #unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  
  ## Training data
  trainx <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header= FALSE, stringsAsFactors = FALSE)
  trainy <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header= FALSE, stringsAsFactors = FALSE)
  trainxy <- cbind(trainx, trainy)
  trainsubj <-  read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header= FALSE, stringsAsFactors = FALSE)
  trainxys <- cbind(trainxy, trainsubj)
    
  ## Test data
  testx <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header= FALSE, stringsAsFactors = FALSE)
  testy <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header= FALSE, stringsAsFactors = FALSE)
  testxy <- cbind(testx, testy)
  testsubj <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header= FALSE, stringsAsFactors = FALSE)
  testxys <- cbind(testxy,testsubj)

  ## Combine training and test data
  tt <- rbind(trainxys, testxys)

  ## Read the column names
  features <-read.table(".\\UCI HAR Dataset\\features.txt", header = FALSE, stringsAsFactors = FALSE)  
  names <- features[2]
                  
  ## Set column names
  for(i in 1:561)
    colnames(tt)[i] <- names[i,1]
  colnames(tt)[562] <- "activity"
  colnames(tt)[563] <- "subject"
  
  meancols <- grep("-mean", colnames(tt))
  stdcols <-  grep("-std", colnames(tt))
  resultcols <- c(meancols, stdcols, 562, 563)
  trainandtest <- tt[resultcols]
  
  activitylabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", header= FALSE, stringsAsFactors = FALSE)
  colnames(activitylabels) <- c("activity", "activityDescription")
  trainandtest <- merge(trainandtest, activitylabels)
  trainandtest <- select(trainandtest, -activity)
  
  ##1 remove the temporary variables
  rm(testx, testy, trainx, trainy, trainsubj, testsubj)
  
  rm(i, activity, activitylabels, features, names, trainandtestx, trainandtesty, trainandtestsubj)
  ## Create a tidy data set of mean values grouped by subject and activity description 
  tidydataset <- trainandtest %>% group_by(subject, activityDescription) %>% summarise_each(funs(mean), vars=-subject,-activityDescription)
  
  ## Write the tidy data to a text file
  write.table(tidydataset, "tidydataset.txt", row.names = FALSE)
}