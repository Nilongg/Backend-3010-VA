/*
Write a stored procedure TransferMoney which implements the first task's functionality.
The procedure takes three parameters: source_account_id, destination_account_id, and transfer_amount.
All of the parameters are IN type. transfer_amount should be type DECIMAL and other parameter should be type INT.
The transfer has to be implemented as a transaction which is
rolled back in a case of an error. If the transaction succeeds the money has been deducted from the source
account and is added to the destination account. Define an OUT parameter exitValue as well and define
all possible error codes.
*/

DELIMITER //

CREATE PROCEDURE TransferMoney(
    IN source_account_id INT,
    IN destination_account_id INT,
    IN transfer_amount DECIMAL(10, 2),
    OUT exitValue INT
)
BEGIN
    DECLARE insufficient_funds CONDITION FOR SQLSTATE '45000';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET exitValue = -1;  -- General error code for SQL exceptions
    END;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the source account has enough balance
    IF (SELECT amount FROM account WHERE id = source_account_id) < transfer_amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds';
    END IF;

    -- Deduct the amount from the source account
    UPDATE account 
    SET amount = amount - transfer_amount 
    WHERE id = source_account_id;

    -- Add the amount to the destination account
    UPDATE account 
    SET amount = amount + transfer_amount 
    WHERE id = destination_account_id;

    -- Commit the transaction if successful
    COMMIT;
    
    -- Set success exit code
    SET exitValue = 0;
END //

DELIMITER ;




