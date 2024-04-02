-- DML = data manipulation language
-- INSERT 

-- insert data ke table users
INSERT INTO users (owner_name, email, password, phone, sex, address, bank_number, store_name)
values("andi", "andi@mail.com", "qwerty", "08651", "L", "surabaya", "098765","maju jaya");

INSERT INTO users (owner_name, email, password, phone, sex, address, bank_number, store_name)
values("budi", "budi@mail.com", "qwerty", "08652", "L", "malang", "098764","laris jaya");
INSERT INTO users (owner_name, email, password, phone, sex, address, bank_number, store_name)
values("budi 3", "budi3@mail.com", "qwerty", "08652", "L", "malang", "098764","laris jaya");

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

INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0010", 3, "beras rajawali", "beras enak merk rajawali", 50000, 5, "makanan", 5);

INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0009", 3, "beras rajawali 1", "beras enak merk rajawali", 50000, 5, "makanan", 5);

INSERT INTO products (id, user_id,product_name, description,price, stock, `type`,weight)
VALUES ("P0011", 6, "gula pasir rajawali", "gula enak merk rajawali", 20000, 5, "makanan", 5);

-- insert ke table profile_picture 
INSERT INTO profile_picture (user_id, url)
VALUES(1,"https://blabla.com/1");

-- tidak bisa, karena 1 user hanya boleh punya 1 foto
INSERT INTO profile_picture (user_id, url)
VALUES(1,"https://foto.com/1a");

INSERT INTO profile_picture (user_id, url)
VALUES(2,"https://foto.com/2");

INSERT INTO profile_picture (user_id, url)
VALUES(5,"https://foto.com/2");

-- SELECT 
-- membaca data, dan menampilkan seluruh kolom
SELECT * FROM users;

SELECT * FROM products;

SELECT * FROM profile_picture;

SELECT * FROM favourites;

-- menampilkan data di spesifik kolom
SELECT id, user_id, product_name from products;

-- menampilkan data tertentu dari satu table dengan where clause
SELECT * FROM products WHERE user_id = 2;
SELECT * FROM products WHERE id = "P0002";
SELECT * FROM products WHERE `type`  = "elektronik" ;
SELECT * FROM products WHERE stock  =10;

SELECT * FROM users WHERE phone is not null;
SELECT * FROM users WHERE phone is null;

-- UPDATE 
-- melakukan edit/update data
UPDATE users SET 
address ="jakarta"
WHERE id = 1;

UPDATE products SET 
price = 150000,
stock = 20
WHERE id = "P0001";

-- DELETE 
-- menghapus data
DELETE FROM products WHERE id = "P0003";

DELETE FROM users WHERE id = 2;

-- FK
-- RESTRICT 
-- kita tidak bisa menghapus data di table parent ketika masih dibutuhkan di table child
-- cara hapus: hapus dulu data di table child, baru anda bisa hapus data di parent

delete from profile_picture WHERE id = 3;
delete from profile_picture WHERE user_id  = 2;
SELECT * FROM profile_picture;
DELETE FROM users WHERE id = 2;
SELECT * from users;

-- CASCADE
-- ketika kita menghapus data di table parent, maka data di table child akan ikut kehapus
DELETE FROM users WHERE id = 5;

-- SOFT DELETE 
SELECT * from users;
SELECT * from products p ;
INSERT INTO favourites (user_id, product_id)
values (6, "P0002");
INSERT INTO favourites (user_id, product_id)
values (6, "P0001");

SELECT * FROM favourites ;
-- menghapus data menggunakan pendekatan soft delete
-- soft delete = data tidak benar" dihapus, melainkan hanya diberi tanda/flag bahwa data tsb dihapus
update favourites set deleted_at = "2024-04-02 21:30:28" WHERE id = 1;
SELECT * FROM favourites WHERE deleted_at is NULL ;

-- LIKE / BETWEEN
SELECT * FROM products p ;
SELECT * FROM products WHERE user_id = 3;
SELECT * FROM products WHERE `type`  = "elektroni" ;
SELECT * FROM products WHERE product_name LIKE "mouse%";
SELECT * FROM products WHERE product_name LIKE "%rajawali";
SELECT * FROM products WHERE product_name LIKE "%rajawali%";
SELECT * FROM products WHERE `type`  LIKE  "%elektroni%" ;

SELECT * FROM products WHERE price BETWEEN 0 AND 100000 ;

-- AND OR 
SELECT * FROM products ; 
SELECT * FROM products WHERE stock > 10 and `type` = 'elektronik' ;
SELECT * FROM products WHERE `type` = 'elektronik' and price BETWEEN 100000 and 200000;

SELECT * FROM products WHERE stock > 10 OR `type` = 'elektronik' ;
SELECT * FROM products WHERE stock > 10 OR `type` = 'elektronik' OR weight = 1 ;

SELECT * FROM products WHERE `type` = 'elektronik' and price BETWEEN 100000 and 200000 or weight =1;

-- ORDER BY
-- ASC : kecil ke besar
-- DESC : besar ke kecil
SELECT * FROM products ;
SELECT * FROM products order by stock ASC;
SELECT * FROM products order by stock DESC;
SELECT * FROM products WHERE stock > 10 OR `type` = 'elektronik' OR weight = 1 order by stock ASC;

-- LIMIT
SELECT * FROM products LIMIT 2;
SELECT * FROM products order by stock ASC LIMIT 1;
SELECT * FROM products WHERE stock > 10 OR `type` = 'elektronik' OR weight = 1 order by stock ASC LIMIT 1;
