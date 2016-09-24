# 6. List all genres from the Genre table that are not represented in the Titles table.
SELECT *
FROM Genre
WHERE Genre NOT IN (
  SELECT Genre
  FROM Titles
);

# 9. List the first name, last name and the birth date of the oldest member without using min(). (Hint: use a subquery and ALL)
SELECT LastName, FirstName, Birthday
FROM Members
WHERE Birthday <= ALL(
  SELECT Birthday
  FROM Members
);

# 10.List the first name, last name and the birth date of the second oldest member.
SELECT FirstName, LastName, Birthday
FROM Members
WHERE Birthday = (
  SELECT MIN(Birthday)
  FROM Members
  WHERE Birthday > (
    SELECT MIN(Birthday)
    FROM Members
  )
);
