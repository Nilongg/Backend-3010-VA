/*
Write a stored procedure TransferMoney which implements the first task's functionality.
The procedure takes three parameters: source_account_id, destination_account_id, and transfer_amount.
All of the parameters are IN type. transfer_amount should be type DECIMAL and other parameter should be type INT.
The transfer has to be implemented as a transaction which is
rolled back in a case of an error. If the transaction succeeds the money has been deducted from the source
account and is added to the destination account. Define an OUT parameter exitValue as well and define
all possible error codes.
*/

DELIMITER $$

CREATE PROCEDURE TransferMoney(
    IN source_account_id INT,
    IN destination_account_id INT,
    IN transfer_amount DECIMAL(10, 2),
    OUT exitValue INT
)
BEGIN
    -- Declare variables for error handling and account balance checks
    DECLARE source_balance DECIMAL(10, 2);
    DECLARE destination_balance DECIMAL(10, 2);
    DECLARE exitHandler INT DEFAULT 0;

    -- Start a transaction
    START TRANSACTION;

    -- Error handling block
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exitValue = -1; -- General error code
        ROLLBACK; -- Rollback the transaction in case of error
    END;

    -- Check if source account has sufficient balance
    SELECT balance INTO source_balance FROM accounts WHERE account_id = source_account_id FOR UPDATE;
    IF source_balance < transfer_amount THEN
        SET exitValue = -2; -- Insufficient funds error
        ROLLBACK;
        LEAVE exitHandler;
    END IF;

    -- Deduct the transfer amount from the source account
    UPDATE accounts
    SET balance = balance - transfer_amount
    WHERE account_id = source_account_id;

    -- Add the transfer amount to the destination account
    UPDATE accounts
    SET balance = balance + transfer_amount
    WHERE account_id = destination_account_id;

    -- Commit the transaction
    COMMIT;

    -- Set success exit code
    SET exitValue = 1;

END$$

DELIMITER ;




