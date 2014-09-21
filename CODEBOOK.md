INPUT:
------
Script uses the dataset named "Human Activity Recognition Using Smartphones Dataset Version 1.0". Below you will find quotation describing the character of the experiment.

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."


DATA PROCESSING:
----------------
Following operations are performed by the run_analysis.R script

*files are loaded
*rows describing subjects (people), activities and the measurements are combined.
*only measurements based on the mean() and std() functions are selected for the further processing.
*measurements are aggregated using mean function, grouped by activity and person.
*names of the measurements are changed to the human readable format, described below.
*final table is saved as a 'summary_mean.txt' file.


OUTPUT FILE:
------------
output file consist of 50 columns.


*1st column - Activity
Text field containing description of one of the six possible activities performed by people involved in the experiment.
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

*2nd column - Person
Number between 1 and 30, identifier of the person taking part in th experiment.

*columns 3-50 named in the following pattern : Domain_Subject_Device_Measurement_Metric_Axis

*Domain -  Time , Frequency
*Subject - Body, Gravity
*Device - Accelerometer, Gyroscope
*Measurement - LinearAcceleration, Jerk, AngularVelocity
*Metric - StandardDeviation, Mean
*Axis - X,Y,Z

These columns contains aggregated values calculated by using mean grouped by activity and person fields.
*Values are normalized and bounded in <-1;1> range.
*Meaning of the measurement name components are following:
*domain - describes the domain of the measurement
*subject - describes if measurement was taken for the body or gravity.
*device - describes type of the device used for taking the measure.
*measurement - type of the measurement (linear acceleration, angular velocity) or calculated variable (jerk)
*metric - describes function used on the readings.
*axis - describes a dimensional component of the 3-axis measurement.


For the exact description of the experiment and the parameters of the variables go to the description of the 
"Human Activity Recognition Using Smartphones Dataset Version 1.0" features_info and readme files.