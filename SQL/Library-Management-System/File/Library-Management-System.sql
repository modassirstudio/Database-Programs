CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(8, 2),
    quantity int
);

CREATE TABLE members(
	member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(30),
    age INT,
	phone VARCHAR(15)
);

CREATE TABLE issued_books(
	issue_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE
);

INSERT INTO books(title, author, category, price, quantity)
VALUES
	('Fluent Python', 'Luciano Ramalho', 'Programming', 2675, 1),
	('Head First Java', 'Kathy Sierra', 'Programming', 1540, 2),
	('Learning SQL', 'Alan Beaulieu', 'Database', 1296, 1),
	('Head First SQL', 'Lynn Beighley', 'Database', 1475, 1),
	('Effective Python', 'Brett Slatkin', 'Programming', 650, 3),
	('Python for Everybody', 'Charles Severance', 'Programming', 575, 2),
	('JavaScript for Kids', 'Nick Morgan', 'Programming', 1667, 1),
	('Eloquent JavaScript', 'Marijn Haverbeke', 'Programming', 2383, 1),
	('Effective Java', 'Joshua Bloch', 'Programming', 719, 4),
	('Clean Code', 'Robert Martin', 'Programming', 708, 3),
	('HTML & CSS: The Complete Reference', 'Thomas A. Powell', 'Programming', 1199, 2),
	('Deep Learning', 'Ian Goodfellow', 'AI', 1990, 5);

INSERT INTO members(name,city,age,phone)
VALUES
	('Aman', 'Delhi', 22, '9876543210'),
	('Sarah', 'Patna', 20, '9876543222'),
    ('Nasir', 'Patna', 23, '8210525256'),
    ('Wajid', 'Bangalore', 25, '7654837219'),
    ('Afsar', 'Mumbai', 27, '6294562132'),
    ('Imran', 'Mumbai', 24, '8220328790'),
    ('Arbaz', 'Delhi', 19, '7661438210'),
    ('Ayan', 'Bangalore', 23, '7653433109'),
	('Sarah', 'Patna', 20, '8856543252'),
    ('Nasir', 'Patna', 23, '6210521357'),
    ('Wajid', 'Bangalore', 25, '7234835210'),
    ('Afsar', 'Mumbai', 27, '6391562130'),
    ('Imran', 'Mumbai', 24, '9220528799'),
    ('Arbaz', 'Delhi', 19, '9308958281'),
    ('Fariq', 'Patna', 19, '8786546212');
    
INSERT INTO issued_books(member_id, book_id, issue_date, return_date)
VALUES
	(1, 2, '2026-01-05', '2026-01-15'),
	(2, 5, '2026-01-22', '2026-02-01'),
	(3, 1, '2026-02-10', '2026-02-20'),
	(4, 8, '2026-03-03', '2026-03-13'),
	(5, 4, '2026-03-25', '2026-04-04'),
	(2, 10, '2026-04-18', '2026-04-28'),
	(6, 7, '2026-05-12', '2026-05-22'),
	(3, 12, '2026-06-09', '2026-06-19'),
	(1, 6, '2026-07-14', '2026-07-24'),
	(5, 9, '2026-08-01', '2026-08-07');
    
-- INTERVIEW TYPE QUESTIONS
-- Display the category of the book with the highest quantity (stock).
SELECT category FROM books ORDER BY quantity DESC LIMIT 1;

-- Display the 5 most expensive books.
SELECT * FROM books ORDER BY price DESC LIMIT 5;

-- Display the city that comes last in alphabetical order.
SELECT city FROM members ORDER BY city DESC LIMIT 1;

-- Display the titles of books whose stock is less than 3.
SELECT title FROM books WHERE stock < 3;

-- Count the number of books whose price is greater than 500.
SELECT COUNT(title) FROM books WHERE price > 500;

-- Calculate the average price of all books.
SELECT AVG(price) FROM books;

-- Display the cheapest and the most expensive book prices.
SELECT MIN(price), MAX(price) FROM books;

-- Count the number of members who are older than 25.
SELECT COUNT(name) FROM members WHERE age > 25;

-- ALL BASIC QUERIES TO REVISE SQL
-- Display all records and all columns from the books table.
SELECT * FROM books;

-- Display only the title and price columns from the books table.
SELECT title, price FROM books;

-- Display all books whose price is greater than 1500.
SELECT * FROM books WHERE price > 1500;

-- Display all books that belong to the 'Programming' category.
SELECT * FROM books WHERE category = 'Programming';

-- Display all members whose age is greater than 20.
SELECT * FROM members WHERE age > 20;

-- Display all books sorted by price from highest to lowest.
SELECT * FROM books ORDER BY price DESC;

-- Display all books sorted by quantity (stock) from lowest to highest.
SELECT * FROM books ORDER BY quantity ASC;

-- Display the top 5 most expensive books.
SELECT * FROM books ORDER BY price DESC LIMIT 5;

-- Update the quantity of the book with book_id = 3 to 20.
UPDATE books SET quantity = 20 WHERE book_id = 3;

-- Change the city of the member with member_id = 2 to Mumbai.
UPDATE members SET city = 'Mumbai' WHERE member_id = 2;

-- Delete the member whose member_id is 8.
DELETE FROM members WHERE member_id = 8;

-- Delete all books whose quantity is 0 (out of stock).
DELETE FROM books WHERE quantity = 0;

-- Add a new column named email to the members table.
ALTER TABLE members ADD email VARCHAR(50);

-- Add a new column named publisher to the books table.
ALTER TABLE books ADD publisher VARCHAR(50);

-- Change the data type of the phone column to VARCHAR(20).
ALTER TABLE members MODIFY phone VARCHAR(20);

-- Rename the quantity column to stock in the books table.
ALTER TABLE books RENAME COLUMN quantity TO stock;

-- Display all book titles in uppercase.
SELECT UPPER(title) FROM books;

-- Display all author names in lowercase.
SELECT LOWER(author) FROM books;

-- Display each book title along with the number of characters in the title.
SELECT title, LENGTH(title) FROM books;

-- Display each book title with its price rounded to the nearest whole number.
SELECT title, ROUND(price) FROM books;

-- Display the current system date.
SELECT CURDATE();

-- Display the current system date and time.
SELECT NOW();

-- Display books whose price is between 400 and 700 (inclusive).
SELECT * FROM books WHERE price BETWEEN 400 AND 700;

-- Display books that belong to either the Programming or Database category.
SELECT * FROM books WHERE category = 'Programming' OR category = 'Database';

-- Display books that do NOT belong to the Programming category.
SELECT * FROM books WHERE NOT category = 'Programming';

-- Display members whose city is either Delhi or Patna.
SELECT * FROM members WHERE city IN ('Delhi', 'Patna');

-- Display books whose title starts with the letter 'P'.
SELECT * FROM books WHERE title LIKE 'P%';

-- Display members whose name ends with the letter 'a'.
SELECT * FROM members WHERE name LIKE '%a';

-- Display books whose title contains the word 'SQL' anywhere in the title.
SELECT * FROM books WHERE title LIKE '%SQL%';