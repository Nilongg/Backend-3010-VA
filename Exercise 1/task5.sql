-- Fetch all the albums which are released between 1990 and 2000 (including both years).
-- Sort the result in descending order by the release year.

SELECT * from album WHERE year >= 1990 AND year <= 2000 ORDER BY year DESC;
--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)