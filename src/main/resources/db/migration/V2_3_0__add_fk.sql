
-- Add FK constraints to the films table
ALTER TABLE films
    ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors(director_id),
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES stars(star_id),
    ADD CONSTRAINT fk_writer FOREIGN KEY (writer_id) REFERENCES writers(writer_id),
    ADD CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id);
