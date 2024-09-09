-- Fetch all the tracks which length is less than one minute or more than five minutes.
-- Sort the result in ascending order by the length.

SELECT * from track WHERE length < '00:01:00' OR length > '00:05:00'
ORDER BY length ASC;
--Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)