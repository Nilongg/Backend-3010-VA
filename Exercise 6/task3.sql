/*
Write a stored procedure which adds a comment to a blog post. Procedure should have error handling implemented.
A comment can be added if the commented post exists and the comment is written by a user who have permissions
to write comments (application user permissions, not database user). Define an out parameter for the procedure
which describes wether there were errors or not and which type of error occured. Define all possible error codes
as a comment.
*/
DELIMITER $$

CREATE PROCEDURE AddComment(
    IN post_id INT,
    IN user_id INT,
    IN comment_text TEXT,
    OUT exitValue INT
)
BEGIN
    -- Declare variables for permission and existence checks
    DECLARE post_exists INT;
    DECLARE user_can_comment INT;

    -- Error handling block
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exitValue = -1; -- General error code for any unexpected error
        ROLLBACK; -- Rollback transaction in case of error
    END;

    -- Start transaction
    START TRANSACTION;

    -- Check if the post exists
    SELECT COUNT(*) INTO post_exists
    FROM posts
    WHERE post_id = post_id;

    IF post_exists = 0 THEN
        SET exitValue = -2; -- Error code for post not found
        ROLLBACK;
        LEAVE AddComment;
    END IF;

    -- Check if the user has permission to comment
    SELECT can_comment INTO user_can_comment
    FROM users
    WHERE user_id = user_id;

    IF user_can_comment = 0 THEN
        SET exitValue = -3; -- Error code for user lacking comment permissions
        ROLLBACK;
        LEAVE AddComment;
    END IF;

    -- Add the comment if all checks pass
    INSERT INTO comments (post_id, user_id, comment_text, created_at)
    VALUES (post_id, user_id, comment_text, NOW());

    -- Commit the transaction
    COMMIT;

    -- Set success exit code
    SET exitValue = 1;

END$$

DELIMITER ;