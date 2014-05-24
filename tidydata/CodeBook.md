Data Set 
=================

IMPORTANT NOTE: For a detailed description of the setup of the experiment and the variables and features from the raw data set please review README.txt and features_info.txt from the raw data set

### Variable and data description

| Variable | Type               | Description                                                                |
|----------|--------------------|----------------------------------------------------------------------------|
| subject  | integer            | Subject who performed the activity. Its range is from 1 to 30.             |
| activity | factor w/ 6 Levels | Activity performed by the subject. The experiments have been               |
|          |                    |   video-recorded to label the activities manually. The levels are WALKING, |
|          |                    |   WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING          |

Furthermore each row contains a selected set of feature from the raw data set. Data data type for each feature is numeric. The features come from the accelerometer and gyroscope 3-axial raw signals. The acceleration signal was then separated into body and gravity acceleration signals. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals to obtain frequency domain signals.


| Pattern              | Meaning/Description                                                      |
|----------------------|--------------------------------------------------------------------------|
| (time/freq)          | Indicates whether the signal comes from a time domain (=time) or         |
|                      |   frequency domain (=freq)                                               |
| .body                | Indicates body signals                                                   |
| .gravity             | Indicates gravity signlas                                                |
| .acceleration        | Indicates that the variable comes from the accelerometer                 |
| .gyro                | Indicates that the variable comes from the gyrometer                     |
| .jerk                | Indicates Jerk signlas for body linear acceleration and angular velocity |
| .magnitude           | Indicates that the variable is a magnitude of the three-dimensional      |
|                      |   signal                                                                 |
| (mean/std)           | Indicates whether the mean or the standard deviation was estimated for   |
|                      |   the signals                                                            |
| (x/y/z)              | Indicates the axis of the 3-axial raw signal                             |


The data set contains variables of the following patterns:
* (time|freq).body.acceleration.(mean|std).(x|y|z)
* (time|freq).body.acceleration.jerk.(mean|std).(x|y|z)
* (time|freq).body.gyro.(mean|std).(x|y|z)
* (time|freq).body.acceleration.magnitude.(mean|std)
* (time|freq).body.acceleration.jerk.magnitude.(mean|std)
* (time|freq).body.gyro.magnitude.(mean|std)
* (time|freq).body.gyro.jerk.magnitude.(mean|std)
* time.gravity.acceleration.(mean|std).(x|y|z)
* time.body.gyro.jerk.(mean|std).(x|y|z)
* time.gravity.acceleration.magnitude.(mean|std)

The variables are averages of each respetive variable for each activity and each subject

### Transformations
* The raw data set contains 561 features. However the data set produced in this project only contains the 68 features that represent the mean value or the standard deviation of the signals, i.e. the script only extracts the mean()-variables and std()-variables from the raw data set
* The mean frequency (measured as the weighted average of the frequency components) is not considered as a mean value of the measured signals is therefore not extracted from the raw data set and hence also not part of the tidy data set
* The same argument applies to angles between vactors that contain means or standard deviations. Therefore all angle()-variables from the raw data set have also not been transferred to the tidy data set
* The variable names from the raw data set have been transfored to comply to [Google's R Style Guide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
* The key values of the activites (1-6) have been replaced by the activity labels
* The features extracted from the raw data set have been averaged for each activity-subject-combination
