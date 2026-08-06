-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS SchoolDB;

USE SchoolDB;
-- Step 2: Create Table (Data Types + Primary Key + Auto Increment)
CREATE TABLE Students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
	class VARCHAR(10),
    marks DECIMAL(5,2),
    city VARCHAR(30)
);
-- Step 3: Insert Data
INSERT INTO Students (name, age, gender, class, marks, city)
VALUES
('Aman', 18, 'M', '12A', 89.5, 'Delhi'),
('Sara', 17, 'F', '12A', 92.0, 'Mumbai'),
('Rahul', 18, 'M', '12B', 76.5, 'Patna'),
('Priya', 17, 'F', '12B', 88.0, 'Kolkata'),
('Vikas', 19, 'M', '12C', 65.0, 'Delhi'),
('Neha', 18, 'F', '12C', 95.5, 'Jaipur'),
('Arjun', 17, 'M', '12A', 81.0, 'Delhi'),
('Pooja', 18, 'F', '12B', 72.5, 'Mumbai'),
('Rohan', 19, 'M', '12C', 91.0, 'Patna'),
('Anjali', 17, 'F', '12A', 85.0, 'Delhi');
-- B.1 
INSERT INTO Students(name, age, gender, class, marks,city) 
VALUES
('Modassir', 22, 'M', '12A', 90.0, 'Bihar');
-- B.2
INSERT INTO Students(name, age, gender, class, marks, city)
VALUES
('Ayan Rahman', 17, 'M', '12B', 83.5, 'Bihar'),
('Aamir Islam', 17, 'M', '12A', 78.5, 'Bihar'),
('Sharique Aftab', 22, 'M', '12A', 98.0, 'Bihar');
-- B.3
INSERT INTO Students(name, age, gender, class, marks,city) 
VALUES
('Modassir', 22, 'M', '12A', 90.0, 'Bihar');

-- C. SELECT Queries
SELECT * FROM Students;
SELECT name, marks FROM Students;
SELECT * FROM Students WHERE city = 'Delhi';
SELECT * FROM Students WHERE marks > 80;
SELECT * FROM Students WHERE gender = 'F';
SELECT * FROM Students WHERE class = '12A';

SET SQL_SAFE_UPDATES = 0;
-- -- C. SELECT Queries
UPDATE Students
SET marks = 82.0
WHERE name = 'Rahul';

UPDATE Students 
SET city = 'Mumbai'
WHERE name = 'Vikas';

UPDATE Students 
SET marks = 89
WHERE name = 'Sharique Aftab';

UPDATE Students
SET marks = marks + 5;

UPDATE Students 
SET class = '12C'
WHERE class = '12D';

-- E. DELETE Queries
DELETE FROM Students
WHERE name = 'Pooja';

DELETE FROM Students 
WHERE city = 'Jaipur';

DELETE FROM Students
WHERE marks < 70;

-- F. ALTER Table
ALTER TABLE Students
ADD COLUMN phone_no INT;

ALTER TABLE Students
MODIFY name VARCHAR(100);

ALTER TABLE Students
RENAME COLUMN class TO section;

ALTER TABLE Students
DROP COLUMN phone_no;

-- G. ORDER BY
SELECT * FROM Students ORDER BY marks; -- ASC is default

SELECT * FROM Students ORDER BY marks DESC;

SELECT * FROM Students ORDER BY age;

SELECT * FROM Students ORDER BY city, marks;

-- H. LIMIT
SELECT * FROM Students ORDER BY marks DESC LIMIT 5;

SELECT * FROM Students ORDER BY marks DESC LIMIT 3;

SELECT * FROM Students ORDER BY city = 'Delhi' DESC LIMIT 2;

-- I. Aggregate Functions
SELECT COUNT(*) FROM Students;

SELECT AVG(marks) AS avg_marks FROM Students;

SELECT MAX(marks) AS max_marks FROM Students;

SELECT MIN(marks) AS min_marks FROM Students;

SELECT SUM(marks) AS total_sum FROM Students;

SELECT COUNT(*) AS students_from_delhi FROM Students WHERE city = 'Delhi';

-- J. Challenge Questions
-- 5
SELECT * FROM Students WHERE marks BETWEEN 70 AND 90;
-- 6
SELECT * FROM Students WHERE city = 'Delhi' ORDER BY marks DESC LIMIT 3;