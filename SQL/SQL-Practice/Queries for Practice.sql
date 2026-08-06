-- CREATE TABLE IF NOT EXISTS STUDENTS22(
-- student_id INT PRIMARY KEY,
-- name VARCHAR(50),
-- age INT,
-- gender CHAR(1),
-- city VARCHAR(50)
-- );
-- INSERT INTO STUDENTS22(student_id, name, age, gender, city) 
-- VALUES	(1, 'Modassir', 22, 'M', 'Bihar'),
-- 		(2, 'Amaan', 22, 'M', 'Mumbai'),
--         (3, 'Ayan', 19, 'M', 'Delhi'),
--         (4, 'Aqsa', 20, 'F', 'Mumbai'),
--         (5, 'Fatima', 22, 'F', 'Bihar'),
--         (6, 'ABC', 22, 'M', 'Bihar');

-- SELECT * FROM students ORDER BY age ASC LIMIT 1 OFFSET 1;
-- USE schooldb;
-- SELECT count(student_id) as total_students FROM students where city = 'Mumbai';
-- SELECT sum(age) AS max_age FROM students;
-- SELECT LCASE(name) AS LOWER_CASE FROM  students;

-- SELECT name AS NAME, LENGTH(name) AS NAME_LENGTH FROM students;
-- select * from students where name like "A%" and age >18;

-- create table if not exists orders2(
-- 		order_id int primary key auto_increment,
--         customer_name varchar(50),
--         product_name varchar(50),
--         quatity int,
--         order_date date);

-- insert into orders2( customer_name, product_name, quatity, order_date)
-- values('A', 'Laptop', 1, '2026-06-16'),
-- 	('B', 'Keyboard', 2, '2026-06-16'),
--     ('C', 'Laptop', 1, '2026-06-16'),
--     ('D', 'Keyboard', 3, '2026-06-16'),
--     ('E', 'Laptop', 2, '2026-06-16'),
--     ('F', 'Mouse', 6, '2026-06-16');
-- select sum(quatity) from orders2;
-- select count(order_date) from orders2 where order_date = current_date();
-- update orders2
-- set quatity = 5
-- where order_id = 3;

DELETE FROM orders2 
WHERE order_date <= DATEADD(day, -365, GETDATE());