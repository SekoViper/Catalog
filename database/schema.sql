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
