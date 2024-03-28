-- DDL
-- membuat database
CREATE DATABASE db_be22;

-- memilih db yang akan digunakan/ di manage
USE db_be22;

-- membuat table
CREATE TABLE users(
	id int primary key auto_increment,
	owner_name varchar(255) not null,
	email varchar(255) not null unique,
	password varchar(255) not null,
	phone varchar(255),
	sex varchar(255),
	address text,
	bank_number varchar(255),
	store_name varchar(255)
);

-- menampilkan seluruh table di suatu db
show tables;
-- menampilkan list seluruh column di suatu table
show columns from users;
show columns from products;

-- membuat table product dengan kolom foreign key ke table user
create table products(
	id varchar(255) primary key,
	user_id int,
	product_name varchar(255),
	description text,
	price decimal,
	stock int,
	type varchar(255),
	weight int,
	constraint fk_users_products foreign key(user_id) references users(id)
);