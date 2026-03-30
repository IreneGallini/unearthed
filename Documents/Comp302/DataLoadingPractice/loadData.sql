
DROP TABLE IF EXISTS raw_data;
CREATE TABLE raw_data(
    college_ID INT,
    college_name VARCHAR(255),
    dept_code VARCHAR(10),
    dept_name VARCHAR(255),
    course_code VARCHAR(10),
    course_number INT,
    course_name VARCHAR(255),
    section_number INT,
    section_semester VARCHAR(50),
    section_year INT,
    student_ID INT,
    firstName VARCHAR(255),
    middleName VARCHAR(255),
    lastName VARCHAR(255),
    graduatingYear INT,
    letterGrade VARCHAR(5)
);

LOAD DATA LOCAL INFILE 'raw_data.tsv' 
INTO TABLE raw_data 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO college(id, name) 
SELECT DISTINCT college_ID, college_name FROM raw_data;

INSERT INTO department(code, name, college_ID) 
SELECT DISTINCT dept_code, dept_name, college_ID FROM raw_data;

INSERT INTO course(code, number, name, department_code) 
SELECT DISTINCT course_code, course_number, course_name, dept_code FROM raw_data;

INSERT INTO section(course_code, course_number, number, semester, year) 
SELECT DISTINCT course_code, course_number, section_number, section_semester, section_year FROM raw_data;

INSERT INTO student(ID, firstName, middleName, lastName, graduatingYear) 
SELECT DISTINCT student_ID, firstName, middleName, lastName, graduatingYear FROM raw_data;

INSERT INTO enrollment(student_id, section_course_code, section_course_number, section_number, section_semester, section_year, letterGrade)
SELECT student_ID, course_code, course_number, section_number, section_semester, section_year, letterGrade FROM raw_data;