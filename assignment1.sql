create database bikesstore

create schema sales

create schema production

create table sales.customers(
customer_id int identity primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone numeric(10) not null,
email varchar(50) unique not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
zip_code numeric(10) not null
)


create table sales.stores(
store_id int primary key,
store_name varchar(20) not null,
phone numeric(10) not null,
email varchar(50) not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
zip_code numeric(10) not null
)


create table sales.staffs(
staff_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(50) unique not null,
phone numeric(10) unique not null,
active varchar(20) not null,
store_id  int not null,
manager_id int not null,
constraint fk_store_staff foreign key(store_id)
references sales.stores(store_id)
)



create table sales.orders(
order_id int primary key,
customer_id int not null,
order_status varchar(20) not null,
order_date date not null,
required_date date not null,
shipped_date date not null,
store_id int not null,
staff_id int not null,
constraint fk_orders_customer foreign key(customer_id)
references sales.customers(customer_id),
constraint fk_orders_store foreign key(store_id)
references sales.stores(store_id),
constraint fk_orders_staff foreign key(staff_id)
references sales.staffs(staff_id)
)


create table sales.order_items(
order_id int primary key,
item_id int not null,
product_id int not null,
quantity int check(quantity > 0) not null,
list_price int check(list_price > 0) not null,
discount int not null,
constraint fk_orderitem_products foreign key(product_id)
references production.products(product_id)
)


create table production.categories(
category_id int primary key,
category_name varchar(20) not null
)


create table production.brands(
brand_id int primary key,
brand_name varchar(20) not null
)



create table production.products(
product_id int primary key,
product_name varchar(20) not null,
brand_id int not null,
category_id int not null,
model_year numeric(4) not null,
list_price int not null,
constraint fk_products_brand foreign key(brand_id)
references production.brands(brand_id),
constraint fk_products_categories foreign key(category_id)
references production.categories(category_id)
)


create table production.stocks(
store_id int not null,
product_id int not null,
quantity int not null,
constraint fk_stocks_store foreign key(store_id)
references sales.stores(store_id),
constraint fk_stocks_products foreign key(product_id)
references production.products(product_id)
)


alter table sales.order_items
add item_amount as ((quantity*list_price)-discount)

insert into sales.customers(first_name,last_name,phone,email,street,city,state,zip_code) values
('mark','mark',7284973,'mark@gmail.com','a b street','NewYork','NewYork',40001)

insert into sales.stores(store_id,store_name,phone,email,street,city,state,zip_code) values
(101,'bakers point',802432,'bakers@gmail.com','church road','NewYork','NewYork',40001)

insert into sales.staffs(staff_id,first_name,last_name,email,phone,active,store_id,manager_id) values
(1001,'bill','bill','bill@gmail.com',4893274,'active',101,501)

insert into sales.orders (order_id,customer_id,order_status,order_date,required_date,shipped_date,store_id,staff_id) values
(201,1,'pending','2019-06-14')

delete from sales.customers

select * from sales.customers




