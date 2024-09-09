-- Create a new table called review. The table should have the following columns:
-- - id
-- - name of the reviewer, not null
-- - headline
-- - review text
-- - a reference to the album id which is reviewed, not null

CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    headline VARCHAR(255),
    reviewTxt TEXT,
    album_id INT NOT null,
    FOREIGN KEY(album_id) REFERENCES album(id)
);

--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)