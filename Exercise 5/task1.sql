-- Create a database based on last week's task 3. In that task we designed a database for a blog. The database has
-- to follow the plan created last week. If you need to update the plan, include an updated drawing of the
-- database to your return. Add foreign key restrictions for the tables as well.

CREATE DATABASE blog;

USE blog;

-- Table for User
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table for Author (User to Author relationship is 1:1)
CREATE TABLE Author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Table for Blog (One Author can create many blogs)
CREATE TABLE Blog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES Author(id)
);

-- Table for Comment (Comments belong to a blog, not directly to a user)
CREATE TABLE Comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    blog_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (blog_id) REFERENCES Blog(id)
    FOREIGN KEY (user_id) REFERENCES User(id)
);
--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)




