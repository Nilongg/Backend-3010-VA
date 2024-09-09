-- Fetch all the tracks which name starts with the word "The" and are at least one minute long.
-- Sort the result primarily in ascending order by the name and secondarily
-- in ascending order by the length.

SELECT * from track WHERE name LIKE 'The %' AND length >= '00:01:00'
ORDER BY name ASC, length ASC;
--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)