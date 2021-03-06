DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE screenings (
  id SERIAL2 PRIMARY KEY,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE,
  time VARCHAR(255),
  price INT2,
  vacant_seats INT2
);

CREATE TABLE tickets (
  id SERIAL2 PRIMARY KEY,
  customer_id INT2 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT2 REFERENCES screenings(id) ON DELETE CASCADE
);
