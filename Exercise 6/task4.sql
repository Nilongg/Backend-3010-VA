/*
Design indices for the blog database. Which fields should be indexed and why?
Write index create statements.
*/

-- Primary key indices (created automatically with PRIMARY KEY constraints)
-- Index for posts table's primary key
CREATE INDEX idx_posts_post_id ON posts(post_id);

-- Index for users table's primary key
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index for comments table's primary key
CREATE INDEX idx_comments_comment_id ON comments(comment_id);

-- Foreign key indices (for join performance)
-- Index on post_id in the comments table (to join with posts)
CREATE INDEX idx_comments_post_id ON comments(post_id);

-- Index on user_id in the comments table (to join with users)
CREATE INDEX idx_comments_user_id ON comments(user_id);

-- Filtering indices
-- Index on user_id in the posts table (filter by user)
CREATE INDEX idx_posts_user_id ON posts(user_id);

-- Index on created_at in the posts table (filter or sort posts by date)
CREATE INDEX idx_posts_created_at ON posts(created_at);

-- Index on title in the posts table (filter or search by title)
CREATE INDEX idx_posts_title ON posts(title);

-- Text search index (if needed for full-text search on titles or body)
CREATE FULLTEXT INDEX idx_posts_title_body_fulltext ON posts(title, body);

-- Index on created_at in the comments table (filter or sort comments by date)
CREATE INDEX idx_comments_created_at ON comments(created_at);
