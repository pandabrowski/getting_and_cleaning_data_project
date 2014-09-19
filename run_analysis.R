
#TODO change dimension names

features <- read.table("features.txt" , stringsAsFactors = FALSE);
activity_labels <- read.table("activity_labels.txt" , stringsAsFactors = FALSE);

subject_test <- read.table("./test/subject_test.txt")
X_test <-read.table("./test/X_test.txt")
y_test <-read.table("./test/y_test.txt")

subject_train <- read.table("./train/subject_train.txt")
X_train <-read.table("./train/X_train.txt")
y_train <-read.table("./train/y_train.txt")

x_binded <- rbind(X_train , X_test)
y_binded <- rbind(y_train, y_test)
subject_binded <- rbind(subject_test , subject_train)

remove(X_train,X_test , y_train, y_test, subject_test , subject_train)

names(x_binded) = t(features)[2,]

std_features <- grep("-std\\(\\)-", names(x_binded) ,  value=TRUE) 
mean_features <- grep("-mean\\(\\)-", names(x_binded) ,  value=TRUE)

matching_features <- rbind ( matrix(mean_features, ncol = 1) , matrix(std_features, ncol = 1))
remove(std_features,mean_features)

matching_features_index <- which(names(x_binded) %in% matching_features)
x_binded <- x_binded[,matching_features_index]

names(subject_binded) <- c('Person')
y_activity <- sapply(y_binded[,1] , function(x)  activity_labels[x,2]) 

int_table <- cbind(y_activity , subject_binded ,x_binded , stringsAsFactors = FALSE )
names(int_table)[1] <- "Activity"
remove(matching_features_index,x_binded,y_binded,y_activity, activity_labels, features, matching_features ,  subject_binded)

library(plyr)
#splitter <- unique(int_table[,1:2])
summary_mean <- ddply(int_table , .(Activity, Person), numcolwise(mean) )
remove(int_table)

input_names <- names(summary_mean)
input_names <- gsub( '^t' , 'Time_' , input_names)
input_names <- gsub( '^f' , 'Frequency_' , input_names)
input_names <- gsub( 'Body' , 'Body' , input_names)
input_names <- gsub( 'Gravtity_' , 'Gravity_' , input_names)
input_names <- gsub('AccJerk', '_Accelerometer_Jerk' , input_names)
input_names <- gsub('GyroJerk', '_Accelerometer_Jerk' , input_names)
input_names <- gsub('Acc-', '_Accelerometer_LinearAcceleration_' , input_names)
input_names <- gsub('Gyro-', '_Gyroscope_AngularVelocity_' , input_names)
input_names <- gsub( '\\(\\)' , '' , input_names)
input_names <- gsub( '-' , '_' , input_names)
input_names <- gsub( 'mean' , 'Mean' , input_names)
input_names <- gsub( 'std' , 'StandardDeviation' , input_names)
names(summary_mean) <- input_names
remove(input_names)

write.table(summary_mean, 'summary_mean.txt' , row.name = FALSE)