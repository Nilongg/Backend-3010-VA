-- Give an example of an unnormalized table. Describe why it is problematic to have
-- an unnormalized table in the database. Include some example data in your answer.
-- The data should show clearly the problem (or problems) unnormalized table causes.

/*
An example of an unnormalized table is a table that stores information about customers and their orders, with multiple orders for a single customer in a single row. Here's an example:

| Customer ID | Customer Name | Address | Order 1 ID | Order 1 Date | Order 1 Amount | Order 2 ID | Order 2 Date | Order 2 Amount |
| 1           | John Doe      | 123 Main St   | 1001 | 2022-01-01   | 50             | 1002       | 2022-01-15   | 75 |

This table is problematic for several reasons:

Data Redundancy: If John Doe places more orders, his name and address will be repeated, wasting space.
Update Anomalies: If John Doe moves, his new address must be updated in every row. If missed, the database will hold inconsistent data.
Insert Anomalies: If a new customer without an order is added, there will be NULL values in order columns.
Delete Anomalies: If John Doe's last order is deleted, his entire record is lost.
Limited Scalability: If a customer places more orders, the table needs to be altered to add new columns.
These issues can hinder database performance, increase storage requirements, and introduce data integrity issues, making normalization essential for efficient and scalable database design.
*/