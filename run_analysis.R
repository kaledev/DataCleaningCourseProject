runAnalysis <- function(){
  ## Read in all files
  labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  features <- read.table("UCI HAR Dataset/features.txt", colClasses=c("NULL", NA))
  sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  
  ##Change header to vector
  features <- as.vector(t(features))
  
  ##Clean headers
  features <- gsub("-", "", features)
  features <- gsub("\\(", "", features)
  features <- gsub("\\)", "", features)
  features <- tolower(features)
  
  ##Assign headers
  names(labels) <- c("activity", "activity_name")
  names(y_test) <- "activity"
  names(y_train) <- "activity"
  names(sub_test) <- "subject"
  names(sub_train) <- "subject"
  names(x_test) <- features
  names(x_train) <- features
  
  ##Merge rows
  y_tt <- rbind(y_test, y_train)
  s_tt <- rbind(sub_test, sub_train)
  x_tt <- rbind(x_test, x_train)
  
  ##Keep only the data needed
  x_tt <- x_tt[, 1:6]
  
  ##Merge Cols
  all_tt <- cbind(x_tt, s_tt, y_tt)
  
  ##Merge Activities
  all_tt <- merge(all_tt, labels, by="activity")
  
  ##Reorder
  all_tt <- all_tt[,c(2,3,4,5,6,7,8,1,9)]
  
  ##Create tidy data
  B<-melt(all_tt, id=c("subject", "activity", "activity_name"))
  tidyData<-dcast(B, subject + activity + activity_name ~ variable, fun.aggregate=mean)
  write.table(a, "tidyData.txt", sep="\t")
  tidyData
}