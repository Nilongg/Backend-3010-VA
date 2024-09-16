-- Fetch artist name and their albums. Include albums without artist information in the
-- result set.
-- Include artist's name, albums name and release year to the result.

SELECT artist.name, album.name, album.year
FROM artist
RIGHT JOIN album ON artist.id = album.artist_id
ORDER BY artist.name, album.name;

--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)