-- DML data manipulation language
-- INSERT 

-- insert data ke table users
INSERT INTO users (owner_name, email, password, phone, sex, address, bank_number, store_name)
values("andi", "andi@mail.com", "qwerty", "08651", "L", "surabaya", "098765","maju jaya");

INSERT INTO users (owner_name, email, password, phone, sex, address, bank_number, store_name)
values("budi", "budi@mail.com", "qwerty", "08652", "L", "malang", "098764","laris jaya");

INSERT INTO users (owner_name, email, password, store_name)
values("budi", "budisudarsono@mail.com", "qwerty", "budi sudarsono jaya");

-- error karena password tidak boleh kosong
INSERT INTO users (owner_name, email, store_name)
values("budi2", "budisudarsono2@mail.com", "budi sudarsono jaya");

-- error karena email tidak boleh sama
INSERT INTO users (owner_name, email, password, store_name)
values("budi copy", "budisudarsono@mail.com", "qwerty", "budi sudarsono jaya");

-- insert data ke table products 
INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0001", 1, "mouse logitech", "mouse gaming dari logitech", 200000, 10, "elektronik", 1);

INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0002", 3, "mouse fantech", "mouse gaming dari fantech", 200000, 10, "elektronik", 1);

INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0003", 3, "mouse sony", "mouse gaming dari sony", 250000, 5, "elektronik", 1);

-- error karena id tidak boleh sama
INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0003", 3, "mouse sony", "mouse gaming dari sony", 250000, 5, "elektronik", 1);

-- insert ke table profile_picture 
INSERT INTO profile_picture (user_id, url)
VALUES(1,"https://blabla.com/1");

-- tidak bisa, karena 1 user hanya boleh punya 1 foto
INSERT INTO profile_picture (user_id, url)
VALUES(1,"https://foto.com/1a");

INSERT INTO profile_picture (user_id, url)
VALUES(2,"https://foto.com/2");

-- SELECT 
-- membaca data, dan menampilkan seluruh kolom
SELECT * FROM users;

SELECT * FROM products;

SELECT * FROM profile_picture;

-- menampilkan data di spesifik kolom
SELECT id, user_id, product_name from products;

-- menampilkan data tertentu dari satu table dengan where clause
SELECT * FROM products WHERE user_id = 2;
SELECT * FROM products WHERE id = "P0002";
SELECT * FROM products WHERE `type`  = "elektronik" ;
SELECT * FROM products WHERE stock  =10;

SELECT * FROM users WHERE phone is not null;



