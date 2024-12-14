-- creating database
create database sales;
use sales;

create table orders(
order_id int auto_increment primary key,
customer_name varchar(50) not null,
product_category varchar(50),
ordrerd_item varchar(50),
contact_number varchar(15) unique
);

-- adding order_quantity column to orders table
alter table orders add order_quantity int not null;
desc orders;

-- renaming the table
rename table orders to sales_order;
desc sales_order; 

-- inserting values to table
INSERT INTO sales_order(order_id , customer_name , product_category , ordrerd_item , contact_number , order_quantity)
VALUES
(101,'manu','drinks','juice',23056789,4),
(102,'sanu','drinks','tea',987654321,4),
(103,'anu','snacks','cake',123987654,1);
select * from sales_order;
insert into sales_order(order_id,customer_name,product_category,ordrerd_item ,contact_number,order_quantity)
values 
(104,'vinu','drinks','tea',123456999,3),
(105,'jinu','drinks','coffee',123454489,2),
(106,'siinu','drinks','tea',123456999,1),
(107,'anupama','snacks','puffs',123454489,1),
(108,'sandhya','snack','roll',123456999,5),
(109,'anvitha','drinks','shake',123454489,2);
insert into sales_order(order_id,customer_name,product_category,ordrerd_item ,contact_number,order_quantity)
values 
(110,'riya','drinks','shake',1234506789,3);
select * from sales_order;

-- retrieve data from table
select customer_name,ordrerd_item from sales_order;

-- updating table
update sales_order 
set ordrerd_item='tea'
where order_id=101 and customer_name='manu';

select *from sales_order; 


-- deleting the table using drop
 drop table sales_order ;
 
 
 
 
 
 
 
 
 
 
 








