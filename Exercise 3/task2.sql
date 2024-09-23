-- In task 2 you will need GROUP BY, ORDER BY ja COUNT commands.

-- Find out which Northwind company's employees have sold products and how many.
-- Include the count of sold orders, employee's name and title in the company to
-- the result. Order the result according the number of sales in descending order.
-- Don't include employees that have not sold anything in the result.

SELECT e.first_name, e.last_name, e.job_title, COUNT(o.id) AS sales
FROM employees e
JOIN orders o ON o.employee_id = e.id
GROUP BY e.id
ORDER BY sales DESC;

-- Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)