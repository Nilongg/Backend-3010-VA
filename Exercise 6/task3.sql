/*
Write a stored procedure which adds a comment to a blog post. Procedure should have error handling implemented.
A comment can be added if the commented post exists and the comment is written by a user who have permissions
to write comments (application user permissions, not database user). Define an out parameter for the procedure
which describes wether there were errors or not and which type of error occured. Define all possible error codes
as a comment.
*/

-- Error Codes:
-- 0: No error
-- 1: Blog post not found
-- 2: User does not have permission to comment
-- 3: Comment text cannot be empty
-- 4: Database error (generic error)

DELIMITER //


CREATE PROCEDURE AddComment(
    IN p_blog_id INT,
    IN p_user_id INT,
    IN p_comment_text TEXT,
    OUT p_error_code INT
)
BEGIN
    -- Initialize the error code to 0 (no error)
    SET p_error_code = 0;

    -- Check if the blog post exists
    DECLARE blog_exists INT;
    SELECT COUNT(*) INTO blog_exists FROM Blog WHERE id = p_blog_id;

    IF blog_exists = 0 THEN
        SET p_error_code = 1; -- Blog post not found
        LEAVE proc_end;
    END IF;

    -- Check if the user has permission to comment from the application
    DECLARE role_exists INT;
    SELECT COUNT(*) INTO role_exists
    FROM mysql.roles_mapping
    WHERE User = SUBSTRING_INDEX(SESSION_USER(), '@', 1) AND Role = 'commenter_role';
    --WHERE User = SESSION_USER() AND Role = 'commenter_role';

    if role_exists = 0 THEN
        SET p_error_code = 2; -- User does not have permission to comment
        LEAVE proc_end;
    END IF;

    -- Check if the comment text is not empty
    IF p_comment_text IS NULL OR TRIM(p_comment_text) = '' THEN
        SET p_error_code = 3; -- Comment text cannot be empty
        LEAVE proc_end;
    END IF;

    -- Insert the comment into the Comment table
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            -- On error, set the error code
            SET p_error_code = 4; -- Database error (generic error)
        END;

        INSERT INTO Comment (blog_id, user_id, comment_text) VALUES (p_blog_id, p_user_id, p_comment_text);
    END;

proc_end:
END //

DELIMITER ;