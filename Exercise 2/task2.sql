-- Fetch album and track information for the artist "Iron Maiden".
-- Select Album name, album year, track name, track number and track length to the result.
-- Sort the result primarily by album name and secondarily by track number.

SELECT album.name, album.year, track.name, track.track_number, track.length
FROM album
JOIN track ON album.id = track.album_id
JOIN artist ON album.artist_id = artist.id
WHERE artist.name = "Iron Maiden"
ORDER BY album.name, track.track_number;

-- Alternative solution without join

SELECT album.name, album.year, track.name, track.track_number, track.length
FROM album, track, artist
WHERE album.id = track.album_id
AND album.artist_id = artist.id
AND artist.name = "Iron Maiden"
ORDER BY album.name, track.track_number;


--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)