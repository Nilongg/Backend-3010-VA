-- Insert a new album called "The Final Frontier" and all the tracks for that
-- album. Information of tracks is listed below. The artist is Iron Maiden (id 1).
-- The create_music.sql file will help you to do this task.

-- 1. Satellite 15... The Final Frontier 8.40
-- 2. El Dorado 6.49
-- 3. Mother of Mercy Harris 5.20
-- 4. Coming Home 5.52
-- 5. The Alchemist 4.29
-- 6. Isle of Avalon 9.06
-- 7. Starblind 7.48
-- 8. The Talisman 9.03
-- 9. The Man Who Would Be King 8.28
-- 10. When the Wild Wind Blows 10.59

INSERT INTO album(id, name, year, artist_id) VALUES
	(7, "The Final Frontier", 2010, 1);

INSERT INTO track(name, length, track_number, album_id) VALUES
    ("Satellite 15", "00:08:40", 1, last_insert_id()),
    ("El Dorado", "00:06:49", 2, last_insert_id()),
    ("Mother of Mercy", "00:05:20", 3, last_insert_id()),
    ("Coming Home", "00:05:52", 4, last_insert_id()),
    ("The Alchemist", "00:04:29", 5, last_insert_id()),
    ("Isle of Avalon", "00:09:06", 6, last_insert_id()),
    ("Starblind", "00:07:48", 7, last_insert_id()),
    ("The Talisman", "00:09:03", 8, last_insert_id()),
    ("The Man Who Would Be King", "00:08:28", 9, last_insert_id()),
    ("When the Wild Wind Blows", "00:10:59", 10, last_insert_id());

--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)