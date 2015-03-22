## Data Processing with run_analisys.R

### The source of the data sets

The data sets for this project were obtained at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the experiment is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following text, from the file "features_info.txt", that is inside the above zip file, explains data structure.

---

####Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	tBodyAcc-XYZ 
	tGravityAcc-XYZ 
	tBodyAccJerk-XYZ 
	tBodyGyro-XYZ 
	tBodyGyroJerk-XYZ 
	tBodyAccMag 
	tGravityAccMag 
	tBodyAccJerkMag 
	tBodyGyroMag 
	tBodyGyroJerkMag 
	fBodyAcc-XYZ 
	fBodyAccJerk-XYZ 
	fBodyGyro-XYZ 
	fBodyAccMag 
	fBodyAccJerkMag 
	fBodyGyroMag 
	fBodyGyroJerkMag 

The set of variables that were estimated from these signals are: 

	mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autorregresion coefficients with Burg order equal to 4
	correlation(): correlation coefficient between two signals
	maxInds(): index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): skewness of the frequency domain signal 
	kurtosis(): kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

	gravityMean
	tBodyAccMean
	tBodyAccJerkMean
	tBodyGyroMean
	tBodyGyroJerkMean

The complete list of variables of each feature vector is available in ['features.txt'](https://github.com/manazevedof/GettingAndCleaningData/blob/master/features.txt "Features")

---

### Building a new tidy data set:

The script *run_analisys.R* produces a tidy data set after processing records of eight different sets of data:

1. Label files
	- **activity_labels.txt:** a [6 x 2] table representing the activities’ numbers and names.
	- **features.txt:** a [561 x 2] table with the 561 variable names, representing the different measures done in the experiment.

2. Test files: These three files constitutes columns of a table. Each line represents a subject number, an activity and a series of measures.
	- **subject_test.txt:** A list of 2947 integer numbers, each one representing one of the 30 subjects. 
	- **X_test:** A [2947 x 561] table, each line representing 561 measures of a subject's activity.
	- **y_test:** A list of 2947 integer numbers, each one representing one of the 6 activities.  

3. Train files: These three files constitutes columns of a table. Each line represents a subject number, an activity and a series of measures.
	- **subject_train.txt:** A list of 7352 integer numbers, each one representing one of the 30 subjects. 
	- **X_train:** A [7352 x 561] table, each line representing 561 measures of a subject's activity.
	- **y_train:** A list of 7352 integer numbers, each one representing one of the 6 activities. 

The script's basic steps are:
	
1. Load the libraries *dplyr* and *tidyr*; 
	```r 
	require(dplyr) 
	require(tidyr) 
	```
2. Read the eight files above described; 
	```r 
	actlab <- read.csv("activity_labels.txt",sep="",header=FALSE)
	fealab <- read.csv("features.txt",sep="",header=FALSE)
	test_y <- read.csv("y_test.txt",sep="",header=FALSE)
	test_x <- read.csv("X_test.txt",sep="",header=FALSE)
	test_s <- read.csv("subject_test.txt",sep="",header=FALSE)
	train_y <- read.csv("y_train.txt",sep="",header=FALSE)
	train_x <- read.csv("X_train.txt",sep="",header=FALSE)
	train_s <- read.csv("subject_train.txt",sep="",header=FALSE) 
	```
3. For each data set (test and train): 
	- Rename the columns. In the case of the measures the labels are in the file ['features.txt'](https://github.com/manazevedof/GettingAndCleaningData/blob/master/features.txt "Features");
		```r
		colnames(actlab)<-c('label','activity')
		colnames(fealab)<-c('label','feature')
		colnames(test_x)<-fealab$feature
		colnames(test_y)<-c('label')
		colnames(test_s)<-c('subject')
		colnames(train_x)<-fealab$feature
		colnames(train_y)<-c('label')
		colnames(train_s)<-c('subject') 
		```
	- Bind the three tables with the columns for subject, activity and measures;
		```r
		test <-cbind(test_y,test_s,test_x)
		train <-cbind(train_y,train_s,train_x) 	
		```
4. Merge the two data sets (test and train);
	```r
	total <- rbind(test,train)
	```
5. Remove temporary data sets;
	```r
	rm('test_s','test_x','test_y','test','train_s','train_x','train_y','train')
	```
6. Remove name duplicated columns. The original "X" data sets contains duplicated column names. These columns are not necessary for the new data set and their existence causes an error when using the "select" function;

	```r
	total <- total[, !duplicated(colnames(total))] 
	```
7. Select the measures' columns that represents mean and standard deviation, i.e., these containing "mean()" ou "std()" in the column name;
	```r
	total <- tbl_df(total)
	seldata <- select(total,label,subject,contains("mean()"),contains("std()")) 
	```
8. Name the activities, replacing the values of the activity column with the name of the activities. That was done by merging the data set with the one read from the file ['activity_labels.txt'](https://github.com/manazevedof/GettingAndCleaningData/blob/master/activity_labels.txt "Activity labels");
	```r
	seldata <- merge(actlab,seldata)
	seldata <- select(seldata,-label) 
	```
9. Organize the final arrangement of the data set:
	- Take the multiple measures' columns and collapse them into key-value pairs;
	- Rename the measures' names removing the "()";
	- Group the rows considering the measure (variable), the activity and the subject;
	- Summarise the groups' data with the values' averages;
	```r
	tidyset <- gather(seldata,variable,value,3:68) %>%
		 mutate(variable = gsub("\\(\\)","",variable)) %>%
		 group_by(variable,activity,subject) %>%
		 summarise(mean = mean(value))	
	```
10. Save the new data set to a text file.
	```r
	write.table(tidyset,file="tidyset.txt",row.names=FALSE)
	```
	
---
	
##Data dictionary

#### The new data set is composed by:

- 4 columns -> variable, activity, subject and mean.
- 11880 rows -> 66 variables * 6 activities * 30 subjects

**variable:** the selected variable from the original data sets.

	 1. fBodyAcc-mean-X           
	 2. fBodyAcc-mean-Y           
	 3. fBodyAcc-mean-Z          
	 4. fBodyAcc-std-X            
	 5. fBodyAcc-std-Y            
	 6. fBodyAcc-std-Z           
	 7. fBodyAccJerk-mean-X       
	 8. fBodyAccJerk-mean-Y       	
	 9. fBodyAccJerk-mean-Z      
	10. fBodyAccJerk-std-X        
	11. fBodyAccJerk-std-Y        
	12. fBodyAccJerk-std-Z       
	13. fBodyAccMag-mean          
	14. fBodyAccMag-std           
	15. fBodyBodyAccJerkMag-mean 
	16. fBodyBodyAccJerkMag-std   
	17. fBodyBodyGyroJerkMag-mean 
	18. fBodyBodyGyroJerkMag-std 
	19. fBodyBodyGyroMag-mean     
	20. fBodyBodyGyroMag-std      
	21. fBodyGyro-mean-X         
	22. fBodyGyro-mean-Y          
	23. fBodyGyro-mean-Z          
	24. fBodyGyro-std-X          
	25. fBodyGyro-std-Y           
	26. fBodyGyro-std-Z           
	27. tBodyAcc-mean-X          
	28. tBodyAcc-mean-Y           
	29. tBodyAcc-mean-Z           
	30. tBodyAcc-std-X           
	31. tBodyAcc-std-Y            
	32. tBodyAcc-std-Z            
	33. tBodyAccJerk-mean-X      
	34. tBodyAccJerk-mean-Y       
	35. tBodyAccJerk-mean-Z       
	36. tBodyAccJerk-std-X       
	37. tBodyAccJerk-std-Y        
	38. tBodyAccJerk-std-Z        
	39. tBodyAccJerkMag-mean     
	40. tBodyAccJerkMag-std       
	41. tBodyAccMag-mean          
	42. tBodyAccMag-std          
	43. tBodyGyro-mean-X          
	44. tBodyGyro-mean-Y          
	45. tBodyGyro-mean-Z         
	46. tBodyGyro-std-X           
	47. tBodyGyro-std-Y           
	48. tBodyGyro-std-Z          
	49. tBodyGyroJerk-mean-X      
	50. tBodyGyroJerk-mean-Y      
	51. tBodyGyroJerk-mean-Z     
	52. tBodyGyroJerk-std-X       
	53. tBodyGyroJerk-std-Y       
	54. tBodyGyroJerk-std-Z      
	55. tBodyGyroJerkMag-mean     
	56. tBodyGyroJerkMag-std      
	57. tBodyGyroMag-mean        
	58. tBodyGyroMag-std          
	59. tGravityAcc-mean-X        
	60. tGravityAcc-mean-Y       
	61. tGravityAcc-mean-Z        
	62. tGravityAcc-std-X         
	63. tGravityAcc-std-Y        
	64. tGravityAcc-std-Z         
	65. tGravityAccMag-mean       
	66. tGravityAccMag-std 

**activity**

	1. WALKING
	2. WALKING_UPSTAIRS
	3. WALKING_DOWNSTAIRS
	4. SITTING
	5. STANDING
	6. LAYING

**subject**

	1..30 unique identifier assigned within a subject
	
**mean**

	Average value related to a series of measures of a subject's specific
	activity and variable
	
