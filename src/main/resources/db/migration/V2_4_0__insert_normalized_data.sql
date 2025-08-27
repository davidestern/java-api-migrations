
INSERT INTO directors (name, country)
SELECT DISTINCT director, director_country FROM films_monolithic;

INSERT INTO stars (name, dob)
SELECT DISTINCT star, star_dob FROM films_monolithic;

INSERT INTO writers (name, email)
SELECT DISTINCT writer, writer_email FROM films_monolithic;

INSERT INTO genres (name)
SELECT DISTINCT genre FROM films_monolithic;

INSERT INTO films (title, year, score, director_id, star_id, writer_id, genre_id)
SELECT 
    f.title,
    f.year,
    f.score,
    d.director_id,
    s.star_id,
    w.writer_id,
    g.genre_id
FROM films_monolithic f
JOIN directors d ON f.director = d.name AND f.director_country = d.country
JOIN stars s ON f.star = s.name AND f.star_dob = s.dob
JOIN writers w ON f.writer = w.name AND f.writer_email = w.email
JOIN genres g ON f.genre = g.name;
