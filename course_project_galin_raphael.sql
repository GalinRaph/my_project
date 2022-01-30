-- 3 скрипты создания структуры БД

DROP DATABASE IF EXISTS board_games_store;
CREATE DATABASE board_games_store;
USE board_games_store;


CREATE TABLE games (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name_of_game VARCHAR(50) COMMENT 'Название игры'
) COMMENT 'Общая таблица игр';


CREATE TABLE firm (
	id SERIAL,
    name VARCHAR(150)

) COMMENT 'Общая таблица фирм разработчиков';

CREATE TABLE parametres (
	id SERIAL,
	games_id BIGINT UNSIGNED NOT NULL,
    `type` ENUM('Настольные игры ', 'Warhammer', 'Ролевые игры', 
    'Детские товары', 'Живые карточные игры', 'Хардкорные', 'Семейные', 'Вечериночные'),
    firm_id BIGINT UNSIGNED NOT NULL,
    number_players BIGINT UNSIGNED NOT NULL COMMENT 'Количество игроков', 
    age BIGINT UNSIGNED NOT NULL COMMENT 'Возраст игроков', 
    price BIGINT UNSIGNED NOT NULL COMMENT 'Начальная цена',
    
    FOREIGN KEY (games_id) REFERENCES games(id),
    FOREIGN KEY (firm_id) REFERENCES firm(id)      
) COMMENT 'Параметры игры';

CREATE TABLE shops (
	id SERIAL,
    city VARCHAR(150),
    address VARCHAR(255)    
) COMMENT 'Таблица магазинов' ;

CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE, 	
	phone BIGINT UNSIGNED UNIQUE,
	address VARCHAR(255),
	gender CHAR(1),
	created_at DATETIME DEFAULT NOW()   

) COMMENT 'Таблица зарегистрированных игр';

CREATE TABLE discounts (
	id SERIAL,
    amount_discount BIGINT UNSIGNED NOT NULL,
    description VARCHAR(255)    
) COMMENT 'Скидки';

CREATE TABLE orders (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`order_number` BIGINT UNSIGNED NOT NULL UNIQUE,  
    users_id BIGINT UNSIGNED NOT NULL,  
    games_id BIGINT UNSIGNED NOT NULL,  
	shops_id BIGINT UNSIGNED NOT NULL,
	cost BIGINT UNSIGNED NOT NULL,
	discounts_id BIGINT UNSIGNED NULL,
	created_at DATETIME DEFAULT NOW(),
	
      
    
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (games_id) REFERENCES games(id),
    FOREIGN KEY (shops_id) REFERENCES shops(id),
    FOREIGN KEY (discounts_id) REFERENCES discounts(id)
) COMMENT 'Таблица заказов';

CREATE TABLE vacancies (
	id SERIAL,    
    name VARCHAR(150),
    description VARCHAR(255),   
    shops_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (shops_id) REFERENCES shops(id)
)COMMENT 'Вакансии для соискателей';

CREATE TABLE top (
	id SERIAL,    
    top_name VARCHAR(150),      
    games_id_1 BIGINT UNSIGNED NOT NULL,
    games_id_2 BIGINT UNSIGNED NOT NULL,
    games_id_3 BIGINT UNSIGNED NOT NULL,
    games_id_4 BIGINT UNSIGNED NOT NULL,
    games_id_5 BIGINT UNSIGNED NOT NULL,
    
    
    FOREIGN KEY (games_id_1) REFERENCES games(id),
    FOREIGN KEY (games_id_2) REFERENCES games(id),
    FOREIGN KEY (games_id_3) REFERENCES games(id),
    FOREIGN KEY (games_id_4) REFERENCES games(id),
    FOREIGN KEY (games_id_5) REFERENCES games(id)
    
)COMMENT 'Разные топ 5 игр';

CREATE TABLE meeting (
	id SERIAL,    
    name VARCHAR(150),
    description VARCHAR(255),   
    shops_id BIGINT UNSIGNED NOT NULL,
    meeting_date DATETIME DEFAULT NOW(),
    games_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (games_id) REFERENCES games(id),
    FOREIGN KEY (shops_id) REFERENCES shops(id)
)COMMENT 'Встречи';

-- 5 скрипты наполнения БД данными

INSERT INTO games (name_of_game)
VALUES 
('Стриксхейвен'),
('Калдхейм'),
('Командир'),
('Терос'),
('Dungeon Mayheim'),
('Zendikar'),
('Икория'),
('Лилиана'),
('Гидеон'),
('Расвет Зендикара'),
('Legend of the fire Rings'),
('Runebound Third'),
('Star Wars'),
('Candamir'),
('Elasund'),
('Marvel LCG'),
('Warhammer 40 000'),
('Камера'),
('Музыкальный крокодил'),
('Шкатулка'),
('Магнитная игра'),
('Монополия'),
('Jenga'),
('Детектор Лжи'),
('Cluedo'),
('Немезида'),
('Древний ужас'),
('Мрачная Гавань');

INSERT INTO firm (name)
VALUES 
('Wizzard Of the Coast'),
('Fantasy flight games'),
('HABA'),
('Hasbro');

INSERT INTO parametres (games_id, `type`, firm_id, number_players, age, price)
VALUES 
(1, 'Живые карточные игры', 1, 2, 13, 3290),
(2, 'Живые карточные игры', 1, 2, 13, 2190),
(3, 'Живые карточные игры', 1, 2, 13, 1590),
(4, 'Живые карточные игры', 1, 2, 13, 1990),
(5, 'Живые карточные игры', 1, 4, 8, 1190),
(6, 'Живые карточные игры', 1, 2, 15, 3990),
(7, 'Живые карточные игры', 1, 2, 13, 1800),
(8, 'Живые карточные игры', 1, 2, 13, 890),
(9, 'Живые карточные игры', 1, 2, 13, 920),
(10, 'Живые карточные игры', 1, 2, 13, 1395),
(11, 'Настольные игры ', 2, 5, 14, 3600),
(12, 'Настольные игры ', 2, 4, 14, 4900),
(13, 'Ролевые игры', 2, 2, 14, 1960),
(14, 'Ролевые игры', 2, 4, 12, 3990),
(15, 'Ролевые игры', 2, 4, 10, 4100),
(16, 'Живые карточные игры', 2, 4, 14, 1350),
(17, 'Warhammer', 2, 2, 12, 3176),
(18, 'Детские товары', 3, 1, 2, 1790),
(19, 'Детские товары', 3, 2, 2, 3990),
(20, 'Детские товары', 3, 1, 1, 490),
(21, 'Детские товары', 3, 1, 3, 1790),
(22, 'Семейные', 4, 6, 8, 2790),
(23, 'Вечериночные', 4, 4, 6, 1790),
(24, 'Настольные игры ', 4, 2, 16, 4490),
(25, 'Настольные игры ', 4, 6, 8, 2990),
(26, 'Хардкорные', 4, 5, 13, 11990),
(27, 'Хардкорные', 4, 8, 13, 3990),
(28, 'Хардкорные', 4, 4, 13, 11990);

INSERT INTO shops (address, city)
VALUES ('Набережные Челны, Республика Татарстан, пр-кт Чулман, д.89/57, ТРЦ «Сити Молл», 3 этаж', 'Набережные Челны'),
('Екатеринбург, Свердловская область, пр. Ленина, д. 49', 'Екатеринбург'),
('Казань, Республика Татарстан, пр-т Ямашева, д. 97, ТЦ «XL», Цокольный этаж', 'Казань'),
('Иркутск, Иркутская, ул. Сергеева, д.3, ТРЦ «SilverMall»', 'Иркутск'),
('Уфа, Республика Башкортостан, ул. 50 лет СССР, д. 12', 'Уфа');

INSERT INTO users (id, firstname, lastname, email, phone, gender, address)
VALUES 
(1, 'Ken', 'Masters', 'arlo50@example.org', '9374071116', 'M', 'Набережные Челны'),
(2, 'Chun', 'Li', 'arlo502@example.org', '93740711162', 'F', 'Набережные Челны'),
(3, 'Dee', 'Jay', 'arlo503@example.org', '93740711163', 'M', 'Уфа'),
(4, 'E', 'Honda', 'arlo504@example.org', '93740711164', 'M', 'Казань'),
(5, 'Fei ', 'Long', 'arlo505@example.org', '93740711165', 'M', 'Казань'),
(6, 'M', 'Bison', 'arlo506@example.org', '93740711166', 'M', 'Иркутск'),
(7, 'T', 'Hawk', 'arlo507@example.org', '93740711167', 'M', 'Уфа'),
(8, 'Violent', 'Ken', 'arlo508@example.org', '93740711168', 'M', 'Иркутск'),
(9, 'Evil', 'Ryu', 'arlo509@example.org', '93740711169', 'M', 'Екатеринбург'),
(10, 'R', 'Mika', 'arlo5010@example.org', '937407111610', 'F', 'Уфа'),
(11, 'Shin', 'Akuma', 'arlo5011@example.org', '937407111611', 'M', 'Набережные Челны'),
(12, 'Kung', 'Lao', 'arlo5012@example.org', '937407111612', 'M', 'Екатеринбург'),
(13, 'Liu', 'Kang', 'arlo5013@example.org', '937407111613', 'M', 'Казань'),
(14, 'Sonya', 'Blade', 'arlo150134@example.org', '937407111614', 'M', 'Екатеринбург'),
(15, 'Shang', 'Tsung', 'arlo5015@example.org', '937407111615', 'M', 'Екатеринбург'),
(16, 'Sonya', 'Blade', 'arlo15014@example.org', '9374071116141', 'F', 'Набережные Челны');

INSERT INTO discounts (description, amount_discount)
VALUES
('Нет скидки', 0),
('Скидка за первую покупку',10),
('Скидка на День Рождения',50),
('Скидка на Новый год',30),
('Скидка на 8 марта',20),
('Скидка на 23 февраля',20);

INSERT INTO orders (order_number, users_id, games_id, shops_id, cost, discounts_id)
VALUES
(122457, 1, 28, 1, 11990, 1),
(122458, 1, 28, 1, 11990, 1),
(122459, 1, 28, 1, 11990, 1),
(1224510, 2, 18, 1, 1790, 6),
(1224511, 14, 13, 2, 3990, 3),
(1224512, 5, 17, 3, 1190, 6),
(1224513, 11, 3, 1, 3600, 1),
(1224514, 8, 23, 4, 890, 2),
(1224515, 3, 16, 5, 1590, 5),
(1224516, 13, 15, 3, 1960, 6),
(1224517, 7, 11, 5, 1800, 1),
(1224518, 14, 10, 2, 3990, 1),
(1224519, 9, 19, 2, 920, 1),
(1224520, 16, 11, 1, 1350, 3),
(1224521, 4, 15, 3, 1990, 1),
(1224522, 6, 1, 4, 3990, 4),
(1224523, 4, 28, 4, 11990, 1);

INSERT INTO vacancies (name, description, shops_id)
VALUES ('Продавец-консультант', 'Продавец-консультант', 2),
('Аниматор', 'Необходимо надевать костюм', 1),
('Мастер', 'Мастер обучает играм, проводит встречи', 3),
('Уборщик', 'Производит уборку', 3);

INSERT INTO top (top_name, games_id_1, games_id_2, games_id_3, games_id_4, games_id_5)
VALUES ('Топ 5 популярных игр', 22, 23, 17, 13, 16),
('Топ 5 детских игр игр', 21, 20, 19, 18, 17),
('Топ 5 настолок', 12, 24, 25, 13, 22);

INSERT INTO meeting (name, description, shops_id, meeting_date, games_id)
VALUES ('Ролёвка', 'Играем в ролевую игру шесть часов подряд', 1, '2021-04-28', 14),
('Встреча вархамер', 'Несём возмездие во имя императора', 2, '2021-04-29', 17),
('Семейная монополия', 'Играем в монополию всей семьёй', 3, '2021-05-01', 22),
('Встреча вархамер 2', 'Несём возмездие во имя императора', 1, '2021-05-29', 17),
('Встреча вархамер 3', 'Несём возмездие во имя императора', 1, '2021-06-29', 17);

-- 6 скрипты характерных выборок
SELECT name_of_game -- простой запрос
FROM games;

SELECT name_of_game AS 'Название игры', -- запрос с вложенным подзапросом
(SELECT `type` FROM parametres WHERE games.id = parametres.games_id) AS 'Тип',
(SELECT price FROM parametres WHERE games.id = parametres.games_id) AS 'Цена'
FROM games;



SELECT (SELECT firstname FROM users WHERE users.id = users_id) AS 'Имя', -- запрос для сравнения со следующим
users_id, shops_id, games_id	
FROM orders
WHERE games_id = 28;

SELECT (SELECT firstname FROM users WHERE users.id = users_id) AS 'Имя', -- запрос с группировкой по ID юзера, который заказал игру с ID = 28
users_id, shops_id, games_id 
FROM orders
WHERE games_id = 28
GROUP BY users_id;



SELECT * FROM games LEFT JOIN parametres USING(id); -- JOIN запрос для выведения параметров игры

SELECT u.firstname, -- JOIN запрос для выведения данных пользователя по заказу 
	u.lastname,
	u.address,
	o.games_id,
	(SELECT name_of_game FROM games WHERE o.games_id = games.id) AS 'Название',
	o.cost 
FROM users AS u 
JOIN orders AS o
WHERE u.id = o.users_id;

SELECT u.firstname, -- JOIN запрос с подсчётом количества заказов от одного пользователя по имени Кен
	u.lastname,
	u.address,
	o.games_id,
	(SELECT name_of_game FROM games WHERE o.games_id = games.id) AS 'Название',
	o.cost, 
	COUNT(u.firstname) AS 'Количество заказов'
FROM users AS u 
JOIN orders AS o
WHERE u.id = o.users_id AND u.firstname = 'Ken';


-- 7 представления (минимум 2);

-- Данное представление выводит всех пользователей города Казань. 
-- Например, чтобы с их данными могли работать только сотрудники Казанского отделения магазина настольных игр
CREATE VIEW users_from_kazan AS SELECT firstname, lastname, address, gender FROM users WHERE address = 'Казань';
SELECT * FROM users_from_kazan;

-- Следующее представление выводит данные пользователей, сделавших заказ в нашей сети магазинов
CREATE VIEW users_orders AS  
SELECT u.firstname,
	u.lastname,
	u.address,
	o.games_id,
	(SELECT name_of_game FROM games WHERE o.games_id = games.id) AS 'Название',
	o.cost 
FROM users AS u 
JOIN orders AS o
WHERE u.id = o.users_id;

SELECT * FROM users_orders;

-- 8 хранимые процедуры / триггеры;
-- Данная процедура выводит все встречи из таблицы meeting по ID магазина, в котором они будут проводиться
DROP PROCEDURE IF EXISTS shops_meeting; 

DELIMITER //
CREATE PROCEDURE shops_meeting(IN value INT)
BEGIN
	SELECT * FROM meeting WHERE shops_id = value;
END//
DELIMITER ;

CALL shops_meeting(1); -- встречи в магазине с ID = 1

-- данный триггер сробатывает при добавлении новой игры в таблицу games, передавая в переменную total 
-- количество игр в магазине
DELIMITER //
CREATE TRIGGER count_games AFTER INSERT ON games
FOR EACH ROW 
BEGIN
	SELECT count(*) INTO @total FROM games;
END//
DELIMITER ;

INSERT INTO games (name_of_game) 
VALUES ('Cancara');

SELECT @total;

-- данный триггер срабатывает при удалении новой игры из таблицы games, передавая в переменную total 
-- количество игр в магазине

DELIMITER //
CREATE TRIGGER count_games_delete AFTER DELETE ON games
FOR EACH ROW 
BEGIN
	SELECT count(*) INTO @total FROM games;
END//
DELIMITER ;

DELETE FROM games
WHERE name_of_game = 'Cancara'

SELECT @total;

'Курсовой проект. Галин Рафаэль

Моя база данных - модель хранения данных магазина настольных игр.

1-2
Первая таблица - games. Хранит ID и названия игр.
Вторая таблица - firm. Хранит ID и названия фирм-производителей игр.
Третья таблица - parametres. Хранит в себе данные обо всех играх, такие как: 
	жанр, количество игроков, минимальный возраст, цену. Ссылается на таблицы games и firm по внешним ключам.
Четвёртая таблица - shops. Хранит ID, адреса и города сети магазинов.
Пятая таблица - Users. Хранит ID и информацию о пользователях сайта. 
Шестая таблица - discounts. Хранит в себе информацию о скидках магазина.
Седьмая таблица - orders. Хранит информацию о пользователях и заказанных ими игр, 
	а также магазин, в котором пользователь заберёт заказ. Ссылается на users, games, shops, 
	discounts по внешним ключам.
Восьмая таблица - vacancies. Хранит в себе информацию о вакансиях с привязкой к конкретному магазину.
Девятая таблица - top. Различные Топ-5 игр магазина. Ссылается на таблицу games.
Десятая таблица - meeting. Хранит информацию о сходках, которые устраивает сеть магазинов. Ссылается на games и shops.

6. 
Первый запрос просто выводит список игр из таблицы games.
Второй запрос с подзапросом нужен только для того, чтобы сравнить с третьим.
Третий вопрос выводит и группирует всех пользователей, который заказали игру с ID =28.

Первый JOIN запрос выводит информацию из таблицы games (ID, Название) и сопоставляет их 
	с параметрами из таблицы parametres.
Второй JOIN запрос выводит информацию о пользователях из таблицы users, 
	которые делали заказ, информация о котором выводится из таблицы orders.
Третий JOIN запрос информации о пользователе Кен и сделанных им заказов.

7.
Певрое Представление выводит всех пользователей города Казань. 
Например, чтобы с их данными могли работать только сотрудники Казанского отделения магазина настольных игр.

Второе представление выводит ФИО и адрес пользователей, сделавших заказ игр.

8. 
Процедура shops_meeting выводит все встречи из таблицы meeting по ID магазина, в котором они будут проводиться.

Первый триггер count_games срабатывает при добавлении новой игры в таблицу games, 
	передавая в переменную total количество игр в магазине.

Второй триггер count_games_delete срабатывает при удалении новой игры из таблицы games, 
	передавая в переменную total количество игр в магазине
'




















