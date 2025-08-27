CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    country VARCHAR(100),
    email VARCHAR(255)
);

-- Directors of films
CREATE TABLE film_directors (
    film_id INT REFERENCES films(film_id) ON DELETE CASCADE,
    person_id INT REFERENCES person(person_id) ON DELETE CASCADE,
    PRIMARY KEY (film_id, person_id)
);

-- Writers of films
CREATE TABLE film_writers (
    film_id INT REFERENCES films(film_id) ON DELETE CASCADE,
    person_id INT REFERENCES person(person_id) ON DELETE CASCADE,
    PRIMARY KEY (film_id, person_id)
);

-- Cast (actors in films)
CREATE TABLE film_cast (
    film_id INT REFERENCES films(film_id) ON DELETE CASCADE,
    person_id INT REFERENCES person(person_id) ON DELETE CASCADE,
    role_name VARCHAR(255),  
    PRIMARY KEY (film_id, person_id)
);

-- Change films table
ALTER TABLE films
DROP COLUMN director_id,
DROP COLUMN writer_id,
DROP COLUMN star_id;

-- Add data to new tables
INSERT INTO person (name, dob, country, email)
SELECT DISTINCT director, NULL::DATE, director_country, NULL FROM films_monolithic
UNION
SELECT DISTINCT star, star_dob, NULL, NULL FROM films_monolithic
UNION
SELECT DISTINCT writer, NULL::DATE, NULL, writer_email FROM films_monolithic;

-- Link directors
INSERT INTO film_directors (film_id, person_id)
SELECT f.film_id, p.person_id
FROM films_monolithic m
JOIN films f ON m.title = f.title AND m.year = f.year
JOIN person p ON m.director = p.name;

-- Link writers
INSERT INTO film_writers (film_id, person_id)
SELECT f.film_id, p.person_id
FROM films_monolithic m
JOIN films f ON m.title = f.title AND m.year = f.year
JOIN person p ON m.writer = p.name;

-- Link actors (stars as the main cast member for now)
INSERT INTO film_cast (film_id, person_id, role_name)
SELECT f.film_id, p.person_id, 'Lead Actor'
FROM films_monolithic m
JOIN films f ON m.title = f.title AND m.year = f.year
JOIN person p ON m.star = p.name;
