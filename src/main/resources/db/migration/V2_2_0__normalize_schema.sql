
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE stars (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE
);

CREATE TABLE writers (
    writer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT,
    score INT,
    director_id INT,
    star_id INT,
    writer_id INT,
    genre_id INT
);
