DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS reviews;

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  price REAL NOT NULL,
  description TEXT NOT NULL,
  image TEXT,
  stock INTEGER DEFAULT 0
);

CREATE TABLE users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  access_level INTEGER NOT NULL
);

CREATE TABLE reviews (
  review_id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT UNIQUE NOT NULL,
  user_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO products VALUES (1, 'Tire', 10.15, 'This is a car tire.', '', 25);
INSERT INTO products VALUES (2, 'Bottle', 1.00, 'This is a bottle.', '', 10);
INSERT INTO products (name, price, description, image, stock) VALUES ('asd', 1.00, 'asddddddddddddddddddddddddddddddddasdasdasda.', '', 10);
INSERT INTO products (name, price, description, image, stock) VALUES ('lol', 1.00, 'This is a bottle.', '', 10);

INSERT INTO users VALUES (1, 'admin', 'admin', 2)
