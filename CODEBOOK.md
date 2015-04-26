#### Sequence of steps

* Download the data files (binary mode) from url: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip the files to local folder.
* Read the training data contained in files X_train.txt, y_train.txt and subject_train.txt and store it variables trainx, trainy and trainsubj.
* Read the test data contained in files X_test.txt, y_test.txt and subject_test.txt and store it in variables testx, testy and testsubj.
* Combine the data trainx, trainy into trainxy, combine trainxy and trainsubj into a variable trainxys.
* Combine the data testx, testy into testxy, combine testxy and testsubj into a variable testxys.
* Combine trainxys and testxys into variable tt
* Read the column names from features.txt into features. Extract names from features and set the column names in tt
* Get the indexes of column names containing mean and store it in meancols.
* Get the indexes of column names containing std and store in stdcols.
* Create  resultcols containing indexes of meancols, stdcols, activity and subject.
* Create trainandtest to extract resultcols from tt
* Read activitylabels from activity_labels.txt and set column names as "activity" and "activityDescription"
* Convert table data to double
* Create a tidy dataset of mean and standard values grouped by each subject based on activity 
* Create the output file of the tidy data set using write.table

#### Experimental study design used

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
