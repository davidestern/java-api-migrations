CREATE TABLE films_monolithic (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    director_country VARCHAR(100),
    star VARCHAR(255) NOT NULL,
    star_dob DATE,
    writer VARCHAR(255),
    writer_email VARCHAR(255),
    year INT,
    genre VARCHAR(100),
    score INT CHECK (score >= 0 AND score <= 10)
);
