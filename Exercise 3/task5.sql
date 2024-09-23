/*
Create a new database called Products. Create following tables to the database:

Product
- id: int
- name: varchar

Ingredient
- id: int,
- name: varchar
- calories: DECIMAL

Contains
- ingredient_id: INT
- product_id: INT
- amount: DECIMAL

Define the following foreign key restrictions to the Contains table:
When Ingredient's or Product's id is updated, the updated value is reflected to Contains table.
When an ingredient is deleted, the delete operation is blocked if there are any products
which contains the ingredient. When a product is deleted, the product_id in the Contains
table is set to NULL.
*/

/*
CREATE DATABASE Products;

USE Products;
*/

/*
CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);*/

/*
CREATE TABLE Ingredient (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    calories DECIMAL
);

CREATE TABLE Contains (
    contains_id INT PRIMARY KEY AUTO_INCREMENT,
    ingredient_id INT NOT NULL,
    product_id INT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_contains_ingredient FOREIGN KEY (ingredient_id)
        REFERENCES Ingredient(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_contains_product FOREIGN KEY (product_id)
        REFERENCES product(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);*/

/* TESTS HERE */

/* Inserts for testing */
INSERT INTO Product (id, name) VALUES (1, 'Product A');
INSERT INTO Product (id, name) VALUES (2, 'Product B');

INSERT INTO Ingredient (id, name, calories) VALUES (1, 'Ingredient A', 100);
INSERT INTO Ingredient (id, name, calories) VALUES (2, 'Ingredient B', 150);

INSERT INTO Contains (ingredient_id, product_id, amount) VALUES (1, 1, 5.00);
INSERT INTO Contains (ingredient_id, product_id, amount) VALUES (2, 2, 3.50);

-- Tehnyt ryhmässä (Niilo V, Mikael N, Aleksi O)