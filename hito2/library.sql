CREATE DATABASE library;
USE library;

CREATE TABLE categories
(
    category_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE publishers
(
    Publisher_id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(50)NOT NULL
);

CREATE TABLE books
(
    book_id INTEGER PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    isbn VARCHAR(50) NOT NULL,
    publisher_date DATE NOT NULL,
    DESCRIPTION VARCHAR(100) NOT NULL,
    category_id INTEGER,
    publisher_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ,
    FOREIGN KEY (category_id) REFERENCES publishers(publisher_id)
);
