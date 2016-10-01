# 1. List the name of the artist who recorded the track title 'Front Door'
SELECT ArtistName, t.Title, tr.TrackTitle
FROM Artists a
  INNER JOIN Titles t
  ON a.ArtistID = t.ArtistID
  INNER JOIN Tracks tr
  ON t.TitleID = tr.TitleID
WHERE tr.TrackTitle = 'Front Door';

SELECT ArtistName, t.Title, tr.TrackTitle
FROM Artists a, Titles t, Tracks tr
WHERE a.ArtistID = t.ArtistID
AND t.TitleID = tr.TitleID
AND tr.TrackTitle = 'Front Door';

# 2. List the names of all artists and the StudioID (if any) they worked in
SELECT ArtistName, StudioName
FROM Artists a
LEFT JOIN Titles t
ON a.ArtistID = t.ArtistID
LEFT JOIN Studios s
ON t.StudioID = s.StudioID;

# 3. List any salesperson whose supervisor is supervised by no one.
SELECT sales.FirstName, sales.LastName, supervisor.FirstName
FROM SalesPeople sales
INNER JOIN SalesPeople supervisor
ON sales.Supervisor = supervisor.SalesID
WHERE supervisor.supervisor IS NULL;

# 4. List the names of responsible parties along with the artist name of the artist they are responsible for.
SELECT m.FirstName, m.LastName, a.ArtistName
FROM Members m
INNER JOIN XRefArtistsMembers x
ON m.MemberID = x.MemberID
INNER JOIN Artists a
ON x.ArtistID = a.ArtistID
WHERE RespParty = 1;

# 5. List each genre from the genre table and the total length in minutes of all tracks recorded for that genre if any.
SELECT g.Genre, SUM(LengthSeconds) / 60
FROM Genre g
LEFT JOIN Titles t
ON g.Genre = t.Genre
LEFT JOIN Tracks tr
ON t.TitleID = tr.TitleID
GROUP BY g.Genre;

# 6. For each member, report the member name and home phone number. Concatenate the first and last name of each member with a space between.
SELECT CONCAT(FirstName, ' ', LastName), HomePhone
FROM Members;

# 7. List each artist name and a lead source designation. If the lead source is "Ad", then report "Ad" for the lead source designation. If the lead source is anything else, then report "Not Ad" for the lead source designation.
SELECT ArtistName,
IF(LeadSource = 'Ad', 'Ad', 'Not Ad')
FROM Artists;

SELECT ArtistName,
CASE LeadSource
  WHEN 'Ad' THEN 'Ad'
  ELSE 'Not Ad'
END
FROM Artists;

# 8. Report the studio name and the first name of each studio contact. Hint: the first name is the part before the space.
SELECT StudioName, Contact, TRIM(LEFT(Contact, LOCATE(' ', Contact)))
FROM Studios;

# Last name
SELECT StudioName, Contact, TRIM(SUBSTRING(Contact, LOCATE(' ', Contact)))
FROM Studios;

# 9. Report all the genres from the Genre table. Capitalize the first letter of each and the rest of the letters should be lower case.
SELECT CONCAT(UPPER(LEFT(Genre, 1)), LOWER(SUBSTRING(Genre, 2)))
FROM Genre;

# 10. List every genre from the Genre table and the names of any titles in that genre if any. For any genres without titles, display 'No Titles' in the Title column.
SELECT g.Genre, IFNULL(Title, 'No Titles')
FROM Genre g
LEFT JOIN Titles t
ON g.Genre = t.Genre;
