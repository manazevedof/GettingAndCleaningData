## Data Processing with run_analisys.R

The data sets for this project were obtained at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the experiment is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script produces a tidy data set after processing records of eight different sets of data:

1. Label files

- activity_labels.txt: a [6 x 2] table representing the activities’ numbers and names.
- features.txt: a [561 x 2] table with the 561 variable names, representing the different measures done in the experiment.  

2. Test files

- subject_test.txt: 
- X_test: 
- y_test:

3. Train files

- subject_train.txt: 
- X_train: 
- y_train:



##DATA DICTIONARY

###Data from the accelerometer and gyroscope of mobile phones.

**variable**

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
	
