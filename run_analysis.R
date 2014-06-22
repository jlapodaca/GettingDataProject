###Getting Data Project
library(reshape)

##
# url1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url1,"project.zip") 
# unzip("project.zip")

###############
###Reading in files
##Forum says we should only read these files and not the inertial signals (more raw)
train<-read.table("X_train.txt")
test<-read.table("X_test.txt")

###Column names in "features.txt"
columnames<-read.table("features.txt")

## subject and y; subject is the guy to whom the test was made: y is the activity 
subjecttrain<-read.table("subject_train.txt")
ytrain<-read.table("y_train.txt")
subjecttest<-read.table("subject_test.txt")
ytest<-read.table("y_test.txt")

##Activity labels
actlabels<-read.table("activity_labels.txt")


##################
##Add column names to train and test data
colnames(train)<-columnames[,2]
colnames(test)<-columnames[,2]



############
##1. Merges the training and the test sets to create one data set.

#Adding activity code and Activity Name
test$ActivityCode<-ytest$V1
train$ActivityCode<-ytrain$V1
# 3. Uses descriptive activity names to name the activities in the data set
test$ActivityDescription<-actlabels[match(test$ActivityCode,actlabels$V1),"V2"]
train$ActivityDescription<-actlabels[match(train$ActivityCode,actlabels$V1),"V2"]

#Adding subject
test$Subject<-subjecttest$V1
train$Subject<-subjecttrain$V1

##One single data set
trainytest<-rbind(train,test)


############
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##We will consider only matches with "mean" and "std" to avoid matches such as with kmean

columnsofint<-c(grep("mean[(]|std[(]",names(trainytest)),563,564)
trainytest1<-trainytest[,columnsofint]


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

melteado<-melt(trainytest1,id=c("Subject","ActivityDescription"))
table2<-as.data.frame(cast(melteado, ActivityDescription  + Subject ~ variable, mean, value=c("value")))

write.table(table2,"table2.txt")
