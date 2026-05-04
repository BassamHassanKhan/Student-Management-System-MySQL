-- 1. Database banao
CREATE DATABASE student_db;

-- 2. Database use karo
USE student_db;

-- 3. Agar pehle se tables ho to delete kar do
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- 4. Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- 5. Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- 6. Enrollments Table (relationship table)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 7. Insert Students
INSERT INTO students VALUES
(1, 'Ali', 20),
(2, 'Sara', 22),
(3, 'Ahmed', 21);

-- 8. Insert Courses
INSERT INTO courses VALUES
(101, 'Math'),
(102, 'Physics'),
(103, 'Computer Science');

-- 9. Insert Enrollments
INSERT INTO enrollments VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 101),
(4, 3, 103);

-- 10. Check Tables
SHOW TABLES;

-- 11. Check Data
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- 12. JOIN Query (students + courses)
SELECT students.name, courses.course_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id;

-- 13. GROUP BY (courses per student)
SELECT students.name, COUNT(enrollments.course_id) AS total_courses
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
GROUP BY students.name;

-- 14. GROUP BY (students per course)
SELECT courses.course_name, COUNT(*) AS total_students
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_name;

-- 15. HAVING (students with more than 1 course)
SELECT students.name, COUNT(*) AS total_courses
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
GROUP BY students.name
HAVING COUNT(*) > 0;