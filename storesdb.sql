CREATE DATABASE stores;

/*Создание таблицы 'providers', которое мы позже удалим */
CREATE TABLE providers(
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          providers_name VARCHAR(50) NOT NULL UNIQUE,
                          location VARCHAR(100) NOT NULL
);

/*Первое задание - удаление таблицы */
DROP TABLE providers;

/* Создание таблицы 'stores', которое будет содержать список онлайн-магазинов */
CREATE TABLE stores(
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       company_name VARCHAR(50) NOT NULL UNIQUE,
                       direction VARCHAR(255) NOT NULL ,
                       employees INT UNSIGNED DEFAULT 0,
                       rating FLOAT(5) UNSIGNED DEFAULT 0
);

/* Задание номер 3 - продолжаем заполнять таблицы */
INSERT INTO stores(company_name, direction,employees,rating)VALUES('rozetka','electrical','5200','6');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('allo','electrical','2600','8');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('citrus','electrical','2021','9');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('foxtrot','electrical','4600','9');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('eldorado','electrical','5000','7');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('moyo','electrical','664','7');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('makeup','cosmetics','500','9');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('lamoda','clothing','450','9');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('leBoutique','clothing','500','7');
INSERT INTO stores(company_name, direction,employees,rating)VALUES('mobilluck','electrical','517','5');

/* Создание таблицы 'categories', которое будет содержать категории товаров из разных интернет-магазинов */
CREATE TABLE categories(
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           store_id INT,
                           category_name VARCHAR(50) NOT NULL,
                           category_desc VARCHAR(255) NOT NULL,

                           FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE SET NULL
);

/* Задание номер 2 - изменение имени поля */
ALTER TABLE categories CHANGE category_name cat_name VARCHAR(50);

/* Задание номер 3 - продолжаем заполнять таблицы */
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('1','phone','about phone');
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('2','phone','about phone');
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('3','phone','about phone');
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('4','phone','about phone');
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('5','phone','about phone');
INSERT INTO categories(store_id, cat_name, category_desc)VALUES('1','notebook','about notebook');

/* Создание таблицы 'products', в котором будут товары согласно каждой категории */
CREATE TABLE products(
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         category_id INT,
                         product_name VARCHAR(50) NOT NULL ,
                         product_desc VARCHAR(255) NOT NULL ,
                         price FLOAT(11) UNSIGNED DEFAULT 0,

                         FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

/* Задание номер 3 - продолжаем заполнять таблицы */
INSERT INTO products(category_id, product_name, product_desc,price)VALUES('1','Iphone 13 Pro Max','nice phone','57000');
INSERT INTO products(category_id, product_name, product_desc, price)VALUES('2','Iphone 13 Pro Max','nice phone','52000');
INSERT INTO products(category_id, product_name, product_desc, price)VALUES('3','Iphone 13 Pro Max','nice phone','54523');
INSERT INTO products(category_id, product_name, product_desc, price)VALUES('4','Iphone 13 Pro Max','nice phone','59211');
INSERT INTO products(category_id, product_name, product_desc, price)VALUES('5','Iphone 13 Pro Max','nice phone','58600');

/* Задание номер 4 - изменить значение в записи */
UPDATE `products`
SET `price` = '56999'
WHERE `category_id` = 1;

/* Задание номер 6 - запросы к базе данных (1 запрос из 3) */
SELECT * FROM products WHERE price < 57000;

/* Создание таблицы 'customers', данные о наших 'голодных' клиентах */
CREATE TABLE customers(
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          customer_name VARCHAR(50) NOT NULL,
                          customer_surnname VARCHAR(50) NOT NULL,
                          customer_email VARCHAR(255) NOT NULL UNIQUE
);

/* Задание номер 3 - продолжаем заполнять таблицы */
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Bohdan','Ortynskiy','Example@example.com');
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Vera','Kolos','Vera@example.com');
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Dmitriy','Bino','Dmitriy@example.com');
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Kykla','Dino','Kykla@example.com');
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Daddy','Finger','Daddy@example.com');
INSERT INTO customers(customer_name, customer_surnname, customer_email)VALUES('Vodka','Big','Vodka@example.com');

/* Задание номер 5 - удаление записи из таблицы */
DELETE FROM customers
WHERE customer_name='Vodka';

/* Задание номер 6 - запросы к базе данных (2 запрос из 3) */
SELECT * FROM customers ORDER BY customer_name;

/* Создание таблицы 'orders', данные о 'сытных' заказах наших 'голодных' клиентов */
CREATE TABLE orders(
                       id INT PRIMARY KEY AUTO_INCREMENT,

                       product_id INT,
                       customer_id INT,
                       created_at DATE NOT NULL,
                       productCount INT DEFAULT 1,

                       FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL,
                       FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL


);

/* Задание номер 3 - продолжаем заполнять таблицы */
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('1','1','11.05.2022','2');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('1','5','27.06.2022','1');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('2','3','5.07.2022','1');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('3','1','14.07.2022','2');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('4','5','21.07.2022','1');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('5','4','28.07.2022','3');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('4','1','5.08.2022','1');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('3','3','15.09.2022','1');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('2','5','21.10.2022','2');
INSERT INTO orders(product_id, customer_id,created_at, productCount)VALUES('5','5','17.12.2022','5');

/* Задание номер 8 - добавление колонки */
ALTER TABLE orders ADD COLUMN total INT DEFAULT 0 AFTER productCount;

/* Задание номер 6 - запросы к базе данных (3 запрос из 3) */
SELECT COUNT(*) FROM orders;

/* Задание номер 7 - Join запрос (1 запрос из 2) */
SELECT orders.created_at, orders.productCount, products.product_name, customers.customer_name,products.category_id
FROM orders
         JOIN products ON products.Id = orders.product_id
         JOIN customers ON customers.Id=orders.customer_Id;

/* Задание номер 7 - Join запрос (2 запрос из 2) */
SELECT categories.id, categories.cat_name, stores.company_name
FROM categories
         JOIN stores ON stores.Id = categories.store_id AND stores.company_name='rozetka'

