-- 1.
SELECT   BillingCountry AS Country,
         ROUND(AVG(Total), 2) AS "Total Average"
FROM     Invoice
GROUP BY BillingCountry;

-- 2.
SELECT   Country,
         COUNT(*) AS "Employee Count"
FROM     Employee
GROUP BY Country;

-- 3.
SELECT E.FirstName || ' ' || E.LastName AS Employee,
       M.FirstName || ' ' || M.LastName AS Manager
FROM   Employee E, Employee M
WHERE  E.ReportsTo = M.EmployeeId;

-- 4.
SELECT Track.Name  AS Track,
       Album.Title AS Album,
       Artist.Name AS Artist
FROM   Artist, Album, Track
WHERE  Artist.ArtistId = Album.ArtistId
       AND Album.AlbumId = Track.AlbumId;

-- 5.
SELECT T.Name AS Track
FROM   Track T, PlaylistTrack PT, Playlist P
WHERE  T.TrackId = PT.TrackId
       AND PT.PlaylistId = P.PlaylistId
       AND P.Name = 'TV Shows';

-- 6.
SELECT   T.Name AS Track,
         COUNT(*) AS "Playlist Count"
FROM     Track T, PlaylistTrack PT, Playlist P
WHERE    T.TrackId = PT.TrackId
         AND PT.PlaylistId = P.PlaylistId
GROUP BY T.Name
HAVING   COUNT(*) > 1;

-- 7.
SELECT T.Name AS Track
FROM   Track T, PlaylistTrack PT, Playlist P
WHERE  T.TrackId = PT.TrackId
       AND PT.PlaylistId = P.PlaylistId
       AND P.Name = 'Classical'     

INTERSECT

SELECT T.Name AS Track
FROM   Track T, PlaylistTrack PT, Playlist P
WHERE  T.TrackId = PT.TrackId
       AND PT.PlaylistId = P.PlaylistId
       AND P.Name = 'Classical';  

-- 8.
SELECT   G.Name AS Genre, 
         AVG(T.Milliseconds) AS "Duration Average (ms)"
FROM     Track T, Genre G
WHERE    T.GenreId = G.GenreId
GROUP BY G.Name;
