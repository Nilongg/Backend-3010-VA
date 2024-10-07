-- Add users and roles for the Blog-database. Create roles "author_role" and "commenter_role" and grant those
-- roles appropriate privileges. Add users "author_app" and "commenter_app". The imaginary webapp uses them for
-- adding posts and comments to the blog database. Grant appropriate roles for those users.

-- Create roles
CREATE ROLE author_role;
CREATE ROLE commenter_role;

-- Grant privileges to roles
GRANT SELECT, INSERT, UPDATE, DELETE ON blog.Blog TO author_role;
GRANT SELECT, INSERT ON blog.Comment, blog.Blog TO commenter_role;

-- Create users
CREATE USER author_app;
CREATE USER commenter_app;

-- Grant roles to users
GRANT author_role TO author_app;
GRANT commenter_role TO commenter_app;

--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)