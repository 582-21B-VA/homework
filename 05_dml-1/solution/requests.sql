-- 1.
SELECT title, isbn
FROM   Books;

-- 2.
SELECT title, year_of_publication
FROM   Books
WHERE  year < 1900;

-- 3.
SELECT title, year_of_publication
FROM   Books
WHERE  year_of_publication <> 2006;

-- 4.
SELECT title, country_of_origin
FROM   Books
WHERE  translator IS NULL;

-- 5.
SELECT title, genre
FROM   Books
WHERE  genre IN ('Science Fiction', 'Fantasy');

-- 6.
SELECT title, year_of_publication
FROM   Books
WHERE  year_of_publication BETWEEN 1500 AND 1800;

-- 7.
SELECT isbn, title, country_of_origin
FROM   Books
WHERE  title LIKE '%the%';

-- 8.
SELECT isbn, title, country_of_origin
FROM   Books
WHERE  year_of_publication > 1800 
AND    translator IS NOT NULL;

-- 9.
SELECT DISTINCT genre
FROM   Books;

-- 10.
SELECT   title, 
         year_of_publication,
         CASE WHEN author_last_name IS NULL THEN author_first_name
              ELSE author_first_name || ' ' || author_last_name 
         END AS Author
FROM     Books
ORDER BY year_of_publication DESC, author_last_name ASC;

-- 11.
INSERT INTO Books(
    title,
    isbn,
    year_of_publication,
    author_first_name,
    author_last_name,
    country_of_origin,
    genre,
    translator
)
VALUES (
    'Les nouvelles de St-Petersbourg',
    2742765360,
    2007,
    'Nikolai',
    'Gogol',
    'Russia',
    'Fiction',
    'André Markowicz'
);
