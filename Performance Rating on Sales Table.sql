CREATE TABLE sales (sale_id INT PRIMARY KEY, amount DECIMAL(10,2)); INSERT INTO sales VALUES (1, 15000), (2, 7000), (3, 3000);



SELECT * FROM SALES

/*
Assign performance ratings based on sales amount from the sales table.
*/

--APPROACH 1

SELECT sale_id,
       amount,
       CASE
           WHEN amount = (SELECT MAX(amount) FROM sales) THEN 1
           WHEN amount = (SELECT MIN(amount) FROM sales) THEN 3
           ELSE 2
       END AS performance_rating
FROM sales;

--APPROACH 2

SELECT  sale_id,
		amount,
CASE  	WHEN amount >= 10000 THEN 'Excellent'
		WHEN amount >= 5000 THEN 'Good' 
		ELSE 'Average' END AS rating FROM sales;    