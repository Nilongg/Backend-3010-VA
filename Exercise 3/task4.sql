-- Northwind company has many products for sale. Find out how many orders include
-- each of the products. Write a query which returns all company's products 
-- (the name of the product) and the number of orders. Include the products which are 
-- not part of any order in the result.

SELECT p.product_name, COUNT(od.id) AS orders
FROM Products p
LEFT JOIN Order_Details od ON od.product_id = p.id
GROUP BY p.id;

-- Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)

