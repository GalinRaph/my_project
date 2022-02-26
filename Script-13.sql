DROP DATABASE IF EXISTS yandex_store;
CREATE DATABASE yandex_store;
USE yandex_store;

CREATE TABLE countries (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	population BIGINT,
	gdp BIGINT UNSIGNED NOT NULL
	)
	
CREATE TABLE cities (
	id SERIAL,
	name VARCHAR(50),
	populations BIGINT,
	founded_date DATETIME DEFAULT NOW(),
	country_id BIGINT,
	FOREIGN KEY (country_id) REFERENCES countries(id)
	)
		
CREATE TABLE companies ( 
	id SERIAL,
	name VARCHAR(50),
	city_id BIGINT UNSIGNED NOT NULL,
	revenue BIGINT UNSIGNED NOT NULL,
	labors BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (city_id) REFERENCES cities(id)
	)
	
INSERT INTO countries (id, name, population, gdp)
VALUES (1, 'Usa', 6000000, 14000000),
(2, 'China', 100000000, 8000000),
(3, 'UAR', 700, 200);	
	
INSERT INTO cities (id, name, population, country_id)
VALUES 
(1, 'Vivo', 10, 3),
(2, 'Jifu', 200200, 2),
(3, 'Hoki', 300300, 2),
(4, 'Guanjow', 900400, 2),
(5, 'Ufd', 4000, 1),
(6, 'New-york', 400700, 1);

INSERT INTO companies (name, city_id , revenue, labors)
VALUES ('Ji-ju', 2, 123, 1200),
('Li-lu', 3, 235, 1100),
('Ko-ju', 4, 346, 550),
('LtdJohhny', 6, 9999, 1220),
('Murphey', 5, 9800, 133),
('Vashington', 5, 4500, 1660),
('Scranton', 6, 9100, 188),
('Mumba', 1, 45, 1),
('Munana', 1, 20, 2000),
('Tumba', 1, 19, 4);



SELECT
	(SELECT country_id FROM cities WHERE city_id = cities.id) AS countries_id,
	(SELECT name FROM countries WHERE countries_id = countries.id) AS 'Название страны',
	count('Название страны')
FROM companies
WHERE companies.labors > 1000
GROUP BY countries_id;














