create database my_test;
use my_test; -- use 사용하기 !!
create table members(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    join_date date
    );

DESC members;

insert into members(id, name, join_date)
values(1,'션','2025-01-10');

insert into members(id, name, join_date)
values(2,'네이트','2025-02-15');

select *from members;

delete from members
where id =1;

update members
set name = '네이트2'
where id = 2;
select *from members ; -- * 는 열 전체를 의미

create table products(
	product_id int auto_increment primary key,
    product_name varchar(100) not null,
    product_code varchar(20) unique,
    price int not null,
    stock_count int not null default 0
);

desc products;

create table customers(
	customer_id int auto_increment primary key,
    name varchar(50) not null
);
desc customers;
create table orders(
	order_id int auto_increment primary key,
    customer_id int not null,
    order_date datetime default current_timestamp,
    constraint fk_orders_customers foreign key (customer_id) references customers(customer_id)
);
insert into customers(name) value('홍길동');
insert into orders(customer_id) value(1);
select *from orders;
select *from customers;

insert orders(customer_id) value(999);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`my_test`.`orders`, CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`))
insert customers(name) value(NULL);
-- Error Code: 1048. Column 'name' cannot be null