require(dplyr)
require(tidyr)
# reading data
# activities' labels
actlab <- read.csv("activity_labels.txt",sep="",header=FALSE)
colnames(actlab)<-c('label','activity')
# features' labels
fealab <- read.csv("features.txt",sep="",header=FALSE)
colnames(fealab)<-c('label','feature')
# test data
test_y <- read.csv("y_test.txt",sep="",header=FALSE)
test_x <- read.csv("X_test.txt",sep="",header=FALSE)
test_s <- read.csv("subject_test.txt",sep="",header=FALSE)
colnames(test_x)<-fealab$feature
colnames(test_y)<-c('label')
colnames(test_s)<-c('subject')
test <-cbind(test_y,test_s,test_x)
# train data
train_y <- read.csv("y_train.txt",sep="",header=FALSE)
train_x <- read.csv("X_train.txt",sep="",header=FALSE)
train_s <- read.csv("subject_train.txt",sep="",header=FALSE)
colnames(train_x)<-fealab$feature
colnames(train_y)<-c('label')
colnames(train_s)<-c('subject')
train <-cbind(train_y,train_s,train_x)
# merging the two datasets
total <- rbind(test,train)
# removing temporary files
rm('test_x','test_y','test','train_x','train_y','train')
# removing name duplicated columns
total <- total[, !duplicated(colnames(total))]
total <- tbl_df(total)
# selecting only the measurements of the mean and standard deviation
seldata <- select(total,label,subject,contains("mean()"),contains("std()"))
# naming activities
seldata <- merge(actlab,seldata)
seldata <- select(seldata,-label) 
tidyset <- gather(seldata,variable,value,3:68) %>%
     group_by(variable,activity,subject) %>%
     summarise(mean = mean(value))
write.table(tidyset,file="tidyset.txt",row.names=FALSE)