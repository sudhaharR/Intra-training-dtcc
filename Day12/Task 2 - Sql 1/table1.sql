show databases;

create database DataSql;

use datasql;

 show tables;
 
 CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100),
    genre VARCHAR(50),
    platform VARCHAR(50),
    developer VARCHAR(100),
    publisher VARCHAR(100),
    release_year INT,
    price DECIMAL(10,2),
    rating DECIMAL(3,1),
    sales_millions DECIMAL(10,2)
);


INSERT INTO games
(game_id, game_name, genre, platform, developer, publisher, release_year, price, rating, sales_millions)
VALUES
(1, 'Elden Ring', 'RPG', 'PC', 'FromSoftware', 'Bandai Namco', 2022, 59.99, 9.5, 25.00),
(2, 'GTA V', 'Action', 'PS5', 'Rockstar Games', 'Rockstar Games', 2013, 39.99, 9.7, 200.00),
(3, 'Minecraft', 'Sandbox', 'PC', 'Mojang', 'Microsoft', 2011, 29.99, 9.3, 300.00),
(4, 'FIFA 24', 'Sports', 'PS5', 'EA Sports', 'Electronic Arts', 2023, 69.99, 8.2, 15.00),
(5, 'The Witcher 3', 'RPG', 'PC', 'CD Projekt Red', 'CD Projekt', 2015, 39.99, 9.6, 50.00),
(6, 'God of War Ragnarok', 'Action', 'PS5', 'Santa Monica Studio', 'Sony', 2022, 69.99, 9.4, 15.00),
(7, 'Forza Horizon 5', 'Racing', 'Xbox', 'Playground Games', 'Microsoft', 2021, 59.99, 9.0, 20.00),
(8, 'Cyberpunk 2077', 'RPG', 'PC', 'CD Projekt Red', 'CD Projekt', 2020, 49.99, 8.5, 25.00),
(9, 'Red Dead Redemption 2', 'Action', 'PC', 'Rockstar Games', 'Rockstar Games', 2018, 59.99, 9.8, 65.00),
(10, 'Hogwarts Legacy', 'Adventure', 'PS5', 'Avalanche Software', 'Warner Bros', 2023, 59.99, 8.7, 24.00),
(11, 'Valorant', 'FPS', 'PC', 'Riot Games', 'Riot Games', 2020, 0.00, 8.8, 0.00),
(12, 'Counter Strike 2', 'FPS', 'PC', 'Valve', 'Valve', 2023, 0.00, 8.9, 0.00),
(13, 'Mario Kart 8', 'Racing', 'Nintendo Switch', 'Nintendo', 'Nintendo', 2014, 59.99, 9.0, 70.00),
(14, 'The Last of Us Part II', 'Adventure', 'PS5', 'Naughty Dog', 'Sony', 2020, 49.99, 9.2, 10.00),
(15, 'Assassins Creed Valhalla', 'Action', 'Xbox', 'Ubisoft', 'Ubisoft', 2020, 59.99, 8.4, 20.00),
(16, 'NBA 2K24', 'Sports', 'PS5', 'Visual Concepts', '2K', 2023, 69.99, 7.8, 8.00),
(17, 'Resident Evil 4', 'Horror', 'PC', 'Capcom', 'Capcom', 2023, 59.99, 9.1, 8.50),
(18, 'Starfield', 'RPG', 'Xbox', 'Bethesda', 'Microsoft', 2023, 69.99, 8.0, 12.00),
(19, 'Halo Infinite', 'FPS', 'Xbox', '343 Industries', 'Microsoft', 2021, 59.99, 8.3, 10.00),
(20, 'Animal Crossing New Horizons', 'Simulation', 'Nintendo Switch', 'Nintendo', 'Nintendo', 2020, 59.99, 9.1, 45.00);

SELECT game_name, genre, price
FROM games;

SELECT *
FROM games
WHERE price > 60;

SELECT *
FROM games
WHERE genre = 'RPG';

SELECT game_name, price
FROM games
ORDER BY price DESC;

SELECT game_name, price
FROM games
WHERE price = 0;

SELECT game_name, sales_millions
FROM games
ORDER BY sales_millions DESC
LIMIT 5;

SELECT AVG(price) AS average_price
FROM games;

SELECT 
    MAX(rating) AS highest_rating,
    MIN(rating) AS lowest_rating
FROM games;

SELECT 
    genre,
    COUNT(*) AS number_of_games
FROM games
GROUP BY genre;

SELECT 
    platform,
    SUM(sales_millions) AS total_sales
FROM games
GROUP BY platform
ORDER BY total_sales DESC;

SELECT 
    genre,
    COUNT(*) AS number_of_games
FROM games
GROUP BY genre
HAVING COUNT(*) > 2;
select * from games;

SELECT 
    platform,
    SUM(sales_millions) AS total_sales
FROM games
GROUP BY platform
HAVING SUM(sales_millions) > 50
ORDER BY total_sales DESC;

CREATE TABLE developers (
    developer_id INT PRIMARY KEY,
    developer_name VARCHAR(100),
    country VARCHAR(50),
    founded_year INT
);

INSERT INTO developers
(developer_id, developer_name, country, founded_year)
VALUES
(1, 'FromSoftware', 'Japan', 1986),
(2, 'Rockstar Games', 'USA', 1998),
(3, 'Mojang', 'Sweden', 2009),
(4, 'EA Sports', 'USA', 1991),
(5, 'CD Projekt Red', 'Poland', 2002),
(6, 'Santa Monica Studio', 'USA', 1999),
(7, 'Playground Games', 'UK', 2010),
(8, 'Riot Games', 'USA', 2006),
(9, 'Valve', 'USA', 1996),
(10, 'Nintendo', 'Japan', 1985),
(11, 'Naughty Dog', 'USA', 1984),
(12, 'Ubisoft', 'France', 1986),
(13, 'Visual Concepts', 'USA', 1988),
(14, 'Capcom', 'Japan', 1979),
(15, 'Bethesda', 'USA', 1986),
(16, '343 Industries', 'USA', 2007),
(17, 'Avalanche Software', 'USA', 1995);

SELECT * FROM developers;

SELECT 
    g.game_name,
    g.genre,
    g.price,
    d.developer_name,
    d.country
FROM games g
INNER JOIN developers d
    ON g.developer = d.developer_name;
    
SELECT 
    g.game_name,
    g.genre,
    d.developer_name,
    d.country
FROM games g
INNER JOIN developers d
    ON g.developer = d.developer_name
WHERE d.country = 'Japan';

SELECT 
    d.developer_name,
    d.country,
    COUNT(g.game_id) AS number_of_games
FROM developers d
INNER JOIN games g
    ON d.developer_name = g.developer
GROUP BY d.developer_name, d.country
ORDER BY number_of_games DESC;

SELECT 
    d.developer_name,
    d.country,
    SUM(g.sales_millions) AS total_sales
FROM developers d
INNER JOIN games g
    ON d.developer_name = g.developer
GROUP BY d.developer_name, d.country
ORDER BY total_sales DESC;
