# Code Book for Final Tidy Dataset

This code book describes the variables, data structure, and transformations used to generate the data found in `FinalTidyData.txt`.

## Dataset Description
The final dataset is a summarized version of the Human Activity Recognition Using Smartphones Dataset. It contains 180 observations across 81 variables. 

## Grouping Variables
*   `subject`: The ID of the test subject (integer ranging from 1 to 30).
*   `activity`: The descriptive name of the activity performed by the subject when the measurements were taken. It has 6 possible values:
    *   `WALKING`
    *   `WALKING_UPSTAIRS`
    *   `WALKING_DOWNSTAIRS`
    *   `SITTING`
    *   `STANDING`
    *   `LAYING`

## Extracted Measurements (Averages)
All remaining 79 variables represent the **average (mean)** value of the normalized sensor signals, grouped by each subject and each activity. The original values were normalized and bounded within [-1, 1], making these means unitless.

Key naming conventions applied to the variables for readability:
*   `Time`: Signals captured in the time domain.
*   `Frequency`: Signals transformed into the frequency domain (using a Fast Fourier Transform).
*   `Accelerometer`: Linear acceleration forces measured by the accelerometer sensor.
*   `Gyroscope`: Angular velocity forces measured by the gyroscope sensor.
*   `Mean` / `STD`: Represents whether the value is derived from an original mean or standard deviation measurement.
*   `X` / `Y` / `Z`: Denotes the 3-axial directional vector of the motion.
