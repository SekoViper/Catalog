CREATE TABLE Books(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY,
  label_id INT,
  genre_id INT,
  author_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY(label_id) REFERENCES Label(id),
  FOREIGN KEY(genre_id) REFERENCES Genre(id),
  FOREIGN KEY(author_id) REFERENCES Author(id),
);

CREATE TABLE Label(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY,
  title VARCHAR(255),
  color VARCHAR(255)
)


CREATE TABLE Genre(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY,
  genre_name VARCHAR(255),
  genre_items JSON
);

CREATE TABLE Music_album(
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY,
   label_id INT,
   title VARCHAR(255),
   artist VARCHAR(255),
   year DATE,
   genre VARCHAR(255)
   FOREIGN KEY(label_id) REFERENCES Label(id),
   FOREIGN KEY(genre) REFERENCES Genre(name)
)

CREATE TABLE Author(
  id SERIAL PRIMARY KEY,
  game_id INTEGER NOT NULL,
  label_id INTEGER NOT NULL,
  genre_id INTEGER NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
)

CREATE TABLE Game (
	id SERIAL PRIMARY KEY,
	multiplayer VARCHAR NOT NULL,
	last_played_at DATE NOT NULL,
	publish_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
)

BEGIN;

ALTER TABLE Author
ADD (game_id) INT REFERENCES Game(id);
ADD (label_id) INT REFERENCES Label(id);
ADD (genre_id) INT REFERENCES Genre(id);
SELECT * FROM Item
ORDER BY id;


COMMIT;