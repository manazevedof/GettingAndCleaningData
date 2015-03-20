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

2. Test files
	- **subject_test.txt:**
	- **X_test:**
	- **y_test:**

3. Train files
	- **subject_train.txt:**
	- **X_train:**
	- **y_train:**

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

	Average value related to a series of measures of a subject related to a specific
	activity and variable
	
