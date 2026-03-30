-- Test to ensure relations were created properly
SELECT ID, name FROM college;
SELECT ID,firstName,middleName,lastName,graduatingYear FROM student;
SELECT code, name, college_ID FROM department;
SELECT code, number, name, department_code FROM course;
SELECT course_code,course_number,number,semester,year FROM section;
SELECT student_ID,section_course_code,section_course_number,section_number,section_semester,section_year,letterGrade
FROM enrollment;