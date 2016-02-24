## Getting and Cleaning Data Project

###For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time_accelleration-XYZ and time_gyroscope-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate the following variablese:  

time_body_accelleration_mean_x-axis
time_body_accelleration_mean_y-axis
time_body_accelleration_mean_z-axis
time_body_accelleration_stddev_x-axis
time_body_accelleration_stddev_y-axis
time_body_accelleration_stddev_z-axis
time_gravity_accelleration_mean_x-axis
time_gravity_accelleration_mean_y-axis
time_gravity_accelleration_mean_z-axis
time_gravity_accelleration_stddev_x-axis
time_gravity_accelleration_stddev_y-axis
time_gravity_accelleration_stddev_z-axis
time_body_accelleration_jerk_mean_x-axis
time_body_accelleration_jerk_mean_y-axis
time_body_accelleration_jerk_mean_z-axis
time_body_accelleration_jerk_stddev_x-axis
time_body_accelleration_jerk_stddev_y-axis
time_body_accelleration_jerk_stddev_z-axis
time_body_gyroscope_mean_x-axis
time_body_gyroscope_mean_y-axis
time_body_gyroscope_mean_z-axis
time_body_gyroscope_stddev_x-axis
time_body_gyroscope_stddev_y-axis
time_body_gyroscope_stddev_z-axis
time_body_gyroscope_jerk_mean_x-axis
time_body_gyroscope_jerk_mean_y-axis
time_body_gyroscope_jerk_mean_z-axis
time_body_gyroscope_jerk_stddev_x-axis
time_body_gyroscope_jerk_stddev_y-axis
time_body_gyroscope_jerk_stddev_z-axis
time_body_accelleration_magnitude_mean
time_body_accelleration_magnitude_stddev
time_gravity_accelleration_magnitude_mean
time_gravity_accelleration_magnitude_stddev
time_body_accelleration_jerk_magnitude_mean
time_body_accelleration_jerk_magnitude_stddev
time_body_gyroscope_magnitude_mean
time_body_gyroscope_magnitude_stddev
time_body_gyroscope_jerk_magnitude_mean
time_body_gyroscope_jerk_magnitude_stddev
freq_body_accelleration_mean_x-axis
freq_body_accelleration_mean_y-axis
freq_body_accelleration_mean_z-axis
freq_body_accelleration_stddev_x-axis
freq_body_accelleration_stddev_y-axis
freq_body_accelleration_stddev_z-axis
freq_body_accelleration_jerk_mean_x-axis
freq_body_accelleration_jerk_mean_y-axis
freq_body_accelleration_jerk_mean_z-axis
freq_body_accelleration_jerk_stddev_x-axis
freq_body_accelleration_jerk_stddev_y-axis
freq_body_accelleration_jerk_stddev_z-axis
freq_body_gyroscope_mean_x-axis
freq_body_gyroscope_mean_y-axis
freq_body_gyroscope_mean_z-axis
freq_body_gyroscope_stddev_x-axis
freq_body_gyroscope_stddev_y-axis
freq_body_gyroscope_stddev_z-axis
freq_body_accelleration_magnitude_mean
freq_body_accelleration_magnitude_stddev
freq_body_accelleration_jerk_magnitude_mean
freq_body_accelleration_jerk_magnitude_stddev
freq_body_gyroscope_magnitude_mean
freq_body_gyroscope_magnitude_stddev
freq_body_gyroscope_jerk_magnitude_mean
freq_body_gyroscope_jerk_magnitude_stddev

The set of variables that were estimated from these signals are: 

mean: Mean value

stddev: Standard deviation

