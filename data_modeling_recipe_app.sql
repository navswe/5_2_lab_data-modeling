-- This schema SQL was created using db-fiddle.com

-- SCHEMA SQL:
-- Ingredients table
CREATE TABLE Ingredients (
    ingredient_id SERIAL PRIMARY KEY,
  	ingredient_name VARCHAR,
  	ingredient_description TEXT
);

-- User table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(32) UNIQUE,
    user_email VARCHAR(32) UNIQUE,
    user_password VARCHAR(32),
    user_firstname VARCHAR(32),
    user_lastname VARCHAR(32)
);

-- Occasion table
CREATE TABLE Occasion (
    occasion_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(user_id),
    Occasion_name VARCHAR(100),
    Occasion_date DATE UNIQUE,
    Occasion_description TEXT
);

-- Recipe table
CREATE TABLE Recipe (
    recipe_id SERIAL PRIMARY KEY,
    recipe_title VARCHAR(100),
    recipe_privacy BOOLEAN,
    recipe_instruction TEXT,
    recipe_imageURL TEXT NULL,
    recipe_comments TEXT NULL,
    ingredients_amount TEXT,
    user_id INTEGER REFERENCES Users(user_id)
);

-- Groceries_List table
CREATE TABLE Groceries_List (
    grocery_list_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(user_id),
    ingredient_id INTEGER REFERENCES Ingredients(ingredient_id),
    ingredient_count INTEGER
);

-- Recipes_Occasions table
CREATE TABLE Recipes_Occasions (
    recipe_occasion_id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES Recipe(recipe_id),
    occasion_id INTEGER REFERENCES Occasion(occasion_id)
);

-- recipe_ingredient table
CREATE TABLE recipe_ingredient (
    recipe_ingredient_id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES Recipe(recipe_id),
    ingredient_id INTEGER REFERENCES Ingredients(ingredient_id)
);



-- Query SQL

-- Insert a new user
INSERT INTO Users (username, user_email, user_password, user_firstname, user_lastname)
VALUES ('annabanana', 'ann@email.com', 'pass123', 'Ann', 'Banana');

-- Insert a new recipe
INSERT INTO Recipe (recipe_title, recipe_privacy, recipe_instruction, recipe_imageURL, recipe_comments, ingredients_amount, user_id)
VALUES ('Shrimp Spring Rolls', true, 'Boil shrimp, Wash Veggies, Roll in Rice Paper, Make Dipping Sauce', 'yummyspringroll.jpg', 'Delicious recipe!', 'Yummy', 1);

-- Insert ingredients for the recipe
INSERT INTO Ingredients (ingredient_name, ingredient_description)
VALUES ('Shrimp', 'Shrimp for protein'),
       ('Veggies & Herbs', 'Veggies for daily greens that you like'),
       ('rice paper', 'soft but chewy rice paper to wrap'),
       ('fish sauce', '3 crabs fish sauce brand');

-- Get the ingredient IDs for the recipe
SELECT ingredient_id FROM Ingredients WHERE ingredient_name IN ('Shrimp', 'Veggies & Herbs', 'rice paper', 'fish sauce');

-- -- -- Insert the recipe's ingredients into the recipe_ingredient table
INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
VALUES (1, 1), (1, 2), (1, 3), (1, 4);

-- -- -- Insert a new occasion
INSERT INTO Occasion (user_id, Occasion_name, Occasion_date, Occasion_description)
VALUES (1, 'Weekend_lunch', '2023-07-22', 'Lunch during the weekend when I want something healthy and have time to make fresh spring rolls');


-- -- display all the tables to check
SELECT * FROM users;
SELECT * FROM Recipe;
SELECT * FROM Groceries_List;
SELECT * FROM Ingredients;
SELECT * FROM Occasion;