/*
Create a transaction which transfers 500€ from Checking account to Savings account.
After this create another transaction which transfers 2000€ from Checking account to Saving account.
Why is it important to execute these commands as transactions? Why declaring statements as a
transaction is not usually enough to properly implement this feature?

Note! MariaDB supports variables. You can define the transfered amount as a variable e.g. like
this: SET @amount = 500.00;
*/

-- Create a transaction which transfers 500€ from Checking account to Savings account.
START TRANSACTION;
SET @amount = 500.00;
UPDATE account SET amount = amount - @amount WHERE account.id = 2;
UPDATE account SET amount = amount + @amount WHERE account.id = 1;
COMMIT;

-- Create another transaction which transfers 2000€ from Checking account to Saving account.
START TRANSACTION;
SET @amount = 2000.00;
UPDATE account SET amount = amount - @amount WHERE account.id = 2;
UPDATE account SET amount = amount + @amount WHERE account.id = 1;
COMMIT;

-- It is important to execute these commands as transactions because if something goes wrong during the transaction,
-- the changes will be cancelled and the database will be in the same state as it was before the transaction started.

/*
declaring a transaction alone is often insufficient because
it doesn’t handle concurrency issues, error management, business logic enforcement,
or performance optimizations. These require additional logic and strategies to implement properly.
*/
