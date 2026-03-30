SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS enrollment, section, course, department, college, student;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE college (
    id INT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE department (
    code VARCHAR(10),
    name VARCHAR(255),
    college_ID INT,
    PRIMARY KEY (code),
    FOREIGN KEY (college_ID) REFERENCES college(id)
);

CREATE TABLE course (
    code VARCHAR(10),
    number INT,
    name VARCHAR(255),
    department_code VARCHAR(10),
    PRIMARY KEY (code, number),
    FOREIGN KEY (department_code) REFERENCES department(code)
);

CREATE TABLE section (
    course_code VARCHAR(10),
    course_number INT,
    number INT,
    semester VARCHAR(50),
    year INT,
    PRIMARY KEY (course_code, course_number, number, semester, year),
    FOREIGN KEY (course_code, course_number) REFERENCES course(code, number)
);

CREATE TABLE student (
    ID INT,
    firstName VARCHAR(255),
    middleName VARCHAR(255),
    lastName VARCHAR(255),
    graduatingYear INT,
    PRIMARY KEY (ID)
);

CREATE TABLE enrollment (
    student_id INT,
    section_course_code VARCHAR(10),
    section_course_number INT,
    section_number INT,
    section_semester VARCHAR(50),
    section_year INT,
    letterGrade VARCHAR(5),
    PRIMARY KEY (student_id, section_course_code, section_course_number, section_number, section_semester, section_year),
    FOREIGN KEY (student_id) REFERENCES student(ID),
    FOREIGN KEY (section_course_code, section_course_number, section_number, section_semester, section_year) 
        REFERENCES section(course_code, course_number, number, semester, year)
);