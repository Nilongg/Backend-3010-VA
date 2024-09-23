-- The Northwind database contains following tables: orders and customers.
-- Analyze the structure of these tables and write a query, which returns all orders,
-- that are ordered to New York. Include customer's first and last name, company and
-- the order's shipping date into the result. Make sure orders which are not shipped yet
-- are included in the result.

SELECT c.first_name, c.last_name, c.company, o.shipped_date
FROM Customers c
JOIN Orders o ON o.customer_id = c.id
WHERE c.city = 'New York';

-- Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)