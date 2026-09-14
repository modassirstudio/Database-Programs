create database if not exists shop_analytics;
use shop_analytics;

create table if not exists shop_sales(
	id int primary key auto_increment,
    sale_date date not null,
    product_name varchar(100) not null,
    category varchar(50),
    quantity int not null,
    sell_price decimal(10,2) not null,
    cost_price decimal(10,2) not null,
    total_amount decimal(10,2),
    profit decimal(10,2)
);

insert into shop_sales(sale_date, product_name, category, quantity, sell_price, cost_price, total_amount, profit)values
	('2026-08-01', '3/4 inch Pipe', 'Hardware', 5, 180, 167, 900, 65),
	('2026-08-01', 'Solvent 50ml', 'Chemicals', 10, 110, 101, 1100, 90),
	('2026-08-02', 'Toilet Seat', 'Sanitary', 2, 980, 860, 1960, 240),
	('2026-08-02', 'Aree Blade', 'Tools', 20, 10, 9.20, 200, 16),
	('2026-08-03', 'Tank 1000 Ltr', 'Storage', 1, 8500, 8200, 8500, 300),
	('2026-08-03', '3/4 inch Pipe', 'Hardware', 3, 180, 167, 540, 39),
	('2026-08-04', '5x4 Syphan', 'Hardware', 2, 320, 290, 640, 60),
	('2026-08-04', 'Solvent 50ml', 'Chemicals', 5, 110, 101, 550, 45),
	('2026-08-05', '3 inch Pipe', 'Hardware', 4, 325, 303, 1300, 88),
	('2026-08-05', 'Toilet Seat', 'Sanitary', 1, 980, 860, 980, 120);

-- Query 1: See All Data
select * from shop_sales;

-- Query 2: Find High-Profit Sales
select product_name, profit from shop_sales where profit > 100;

-- Query 3: Sort by Profit (Highest First)
select product_name, profit from shop_sales order by profit desc;

-- Query 4: Total Revenue
select sum(total_amount) as total_revenue from shop_sales;

-- Query 5: Total Profit
select sum(profit) as total_profit from shop_sales;

-- Query 6: Profit by Product (GROUP BY)
select product_name, sum(profit) as total_profit from shop_sales group by product_name;

-- Query 7: Top 3 Selling Products by Quantity
select product_name, sum(quantity) as top_products from shop_sales group by product_name order by top_products desc limit 3;

-- Query 8: Products with Total Profit Above 100 (HAVING)
select product_name, sum(profit) as total_profit from shop_sales group by product_name having total_profit > 100;

-- Query 9: Sales by Category
select category, sum(total_amount) as revenue, sum(profit) as profit from shop_sales group by category order by revenue desc;

-- Query 10: Best Day (Highest Revenue)
select sale_date as best_day, sum(total_amount) as revenue, sum(profit) as total_profit from shop_sales group by best_day order by revenue	 desc limit 1;