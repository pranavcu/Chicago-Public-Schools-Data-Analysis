SELECT * FROM chicago_public_schools_progress_report_cards;

/* Query the database system catalog to retrieve table metadata */
/*The SCHOOLS table contains a large number of columns. How many columns does this table have? */

SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = "chicago_public_schools_progress_report_cards";

/* Query the database system catalog to retrieve column metadata */
/* Now retrieve the the list of columns in SCHOOLS table and their column type (datatype) and length.*/

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = "chicago_public_schools_progress_report_cards"

/* How many Elementary Schools are in the dataset? */ 

SELECT COUNT(*) AS NumberOfES
FROM chicago_public_schools_progress_report_cards
WHERE `Elementary, Middle, or High School` = 'ES';

/* What is the highest Safety Score? */
SELECT MAX(SAFETY_SCORE) AS Highest_Safety_Score
FROM chicago_public_schools_progress_report_cards;
 
/* Which schools have highest Safety Score? */

SELECT NAME_OF_SCHOOL,SAFETY_SCORE
FROM chicago_public_schools_progress_report_cards
WHERE SAFETY_SCORE = ( SELECT MAX(SAFETY_SCORE) FROM chicago_public_schools_progress_report_cards);

/* What are the top 10 schools with the highest "Average Student Attendance"? */
SELECT NAME_OF_SCHOOL,AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools_progress_report_cards
ORDER BY AVERAGE_STUDENT_ATTENDANCE DESC
LIMIT 10 ;

/* Retrieve the list of 5 Schools with the lowest Average Student Attendance sorted in ascending order based on attendance */

SELECT NAME_OF_SCHOOL,AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools_progress_report_cards
ORDER BY AVERAGE_STUDENT_ATTENDANCE ASC
LIMIT 05 ;

/* Now remove the '%' sign from the above result set for Average Student Attendance column */
SELECT NAME_OF_SCHOOL,
	REPLACE(AVERAGE_STUDENT_ATTENDANCE, '%', '') AS AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools_progress_report_cards
ORDER BY AVERAGE_STUDENT_ATTENDANCE ASC
LIMIT 05 ;

/* Which Schools have Average Student Attendance lower than 70%? */ 
SELECT NAME_OF_SCHOOL,
	REPLACE(AVERAGE_STUDENT_ATTENDANCE, '%', '') AS AVERAGE_STUDENT_ATTENDANCE
FROM chicago_public_schools_progress_report_cards
WHERE AVERAGE_STUDENT_ATTENDANCE < 70;
​
/* Get the total College Enrollment for each Community Area */ 

SELECT COMMUNITY_AREA_NAME, SUM(COLLEGE_ENROLLMENT) AS Total_Enrolment 
FROM chicago_public_schools_progress_report_cards
GROUP BY COMMUNITY_AREA_NAME;

/* Get the 5 Community Areas with the least total College Enrollment sorted in ascending order */ 

SELECT COMMUNITY_AREA_NAME, SUM(COLLEGE_ENROLLMENT) AS Total_Enrolment 
FROM chicago_public_schools_progress_report_cards
GROUP BY COMMUNITY_AREA_NAME
ORDER BY Total_Enrolment ASC 
LIMIT 5;

