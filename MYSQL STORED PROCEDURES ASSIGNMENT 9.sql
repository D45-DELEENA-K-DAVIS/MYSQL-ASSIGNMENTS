-- QUERYING DATA
-- CREATING DATABASE
CREATE DATABASE STOREDPROCEDURES;
USE STOREDPROCEDURES;

-- CREATING TABLE 
CREATE TABLE WORKER(
WORKER_ID INT,
FIRSTNAME CHAR(25),
LASTNAME CHAR(25),
SALARY INT(15),
JOININGDATE DATETIME,
DEPARTMENT CHAR(25)
);


-- INSERTING DATA TO TABLE 1
INSERT INTO WORKER (WORKER_ID,FIRSTNAME,LASTNAME,SALARY,JOININGDATE,DEPARTMENT)
VALUE
(1,'ROCKY','MANTIN','100000','2020-04-02 10:10:01','CIVIL');
INSERT INTO WORKER (WORKER_ID,FIRSTNAME,LASTNAME,SALARY,JOININGDATE,DEPARTMENT)
VALUES
(2,'ZAMBIN','VIRNAN',400000,'2020-05-08 10:10:01','ELECTRICAL'),
(3,'RAYAN','YOKUL',500000,'2018-07-11 10:10:01','CYBER'),
(4,'MANVITHA','PRAKSHITH',2000000,'2024-01-21 10:10:01','COMPUTER'),
(5,'ALASKA','ROSE',1000000,'2023-01-02 10:10:01','AI'),
(6,'ABBERLLINA','ASHIQ',1500000,'2021-11-10 10:10:01','IT'),
(7,'VINIYA','VINAY',1200000,'2022-09-02 10:10:01','GRAPHICAL'),
(8,'DELBEL','DALI',2000000,'2020-10-14 10:10:01','ELECTRONICS'),
(9,'BHOOMI','BODTHI',150000,'2022-05-03 10:10:01','COMPUTER'),
(10,'THONKHOI','CHOKNE',700000,'2021-12-12 10:10:01','MECHANICAL');
SELECT *FROM WORKER;

# create stored procedure takes IN parameter for all columns and add a new record to the table 
delimiter //
create procedure GET_USER(IN p_WORKER_ID INT,IN p_FIRSTNAME CHAR(25),IN p_LASTNAME CHAR(25),IN p_SALARY INT(15),IN p_JOININGDATE DATETIME,IN p_DEPARTMENT CHAR(25))
begin
INSERT INTO WORKER(WORKER_ID ,FIRSTNAME,LASTNAME ,SALARY,JOININGDATE ,DEPARTMENT )
VALUES
(p_WORKER_ID ,p_FIRSTNAME,p_LASTNAME ,p_SALARY,p_JOININGDATE ,p_DEPARTMENT);
END //
delimiter ;

# procedure call:
call GET_USER(11,'JOHN','SMITH',500000,'2024-01-06 10:10:01','HR');

SELECT* FROM WORKER

# create a stored procedure by IN parameter for WORKER_ID  and OUT parameter for SALARY also retrive the salaray of the worker with the ID 
delimiter //
create procedure get_usersalary(IN user_id INT,OUT user_salary INT)
begin
select SALARY into user_salary from WORKER where WORKER_ID=user_id;
end //
delimiter ;

set @salary_user=0;

# procedure call
CALL get_usersalary(5,@salary_user);
select @salary_user as salary_of_employee;

#stored procedure taked IN parameter for WORKER_ID and DEPARTMENT
delimiter //
create procedure user_department(IN user_id INT,IN p_department CHAR)
begin
update WORKER 
set DEPARTMENT=p_department
where WORKER_ID=user_id;
end //
delimiter ;
# procedure call
call user_department(12,'SALES');

# create a stored procedure by IN parameter for DEPARTMENT  and OUT parameter for p_workercount also retrive the no of the workers  
delimiter //
create procedure get_usercount(IN p_department CHAR,OUT p_workercount INT)
begin
select count(*)  into p_workercount from WORKER
where Department=p_department;
end //
delimiter ;
set @p_workercount=0;
# procedure call
CALL get_usercount('ELECTRICAL',@p_workercount);
select @p_workercount;


# create a stored procedure by IN parameter for DEPARTMENT  and OUT parameter for p_avgssalaray also retrive the avg salary of the workers  
delimiter //
create procedure get_worker_avgsalary(IN p_department CHAR,OUT p_avgsalary INT)
begin
select AVG(SALARY) into p_avgsalary from WORKER
where Department=p_department;
end //
delimiter ;
set @p_avgsalary=0;
# procedure call
CALL get_worker_avgsalary('IT',@avgsalary);
select @p_avgsalary;

























DROP Procedure STOREDPROCEDURES;





















# number of persons in each country
select COUNTRY_NAME,count(*) as no_of_persons from PERSONS
group by COUNTRY_NAME;

# number of person in each country sorted from high to low
select COUNTRY_NAME,count(*) as no_of_persons from PERSONS
group by COUNTRY_NAME
order by no_of_persons DESC;

# average rating for persons in respective countries if the average is greater than 3.0
select avg(RATING) from PERSONS;
select FNAME,RATING FROM PERSONS
where RATING > 3.0;

# countries with same rating as the UK
select COUNTRY_NAME from PERSONS
where RATING ='3.0';

# countries whose population is greater than the average population of all nations
select avg(POPULATION) from PERSONS;
select COUNTRY_NAME,POPULATION FROM PERSONS
where POPULATION >(select avg(POPULATION) from COUNTRY);





-- CREATING DATABASE
CREATE DATABASE PRODUCTS;
USE PRODUCTS;

-- CREATING TABLE 3
CREATE TABLE CUSTOMER(
CUSTOMER_ID INT,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
EMAIL VARCHAR(50) UNIQUE,
PHONE_NO INT ,
ADDRESS VARCHAR(50),
CITY VARCHAR(50),
STATE VARCHAR(50),
ZIP_CODE INT,
COUNTRY VARCHAR(50)
);

-- INSERTING DATA TO TABLE 3
INSERT INTO CUSTOMER(CUSTOMER_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NO,ADDRESS,CITY,STATE,ZIP_CODE,COUNTRY)
VALUES
(01,'ASHWEL','APS','ashwel000@gmail.com','986543215','ALMOBARIK','CHENNAI','TAMILNADU','45690','INDIA'),
(02,'ASHWINI','VIKPSS','ashwini890@gmail.com','987773215','BARIK','TOKYO','HONSHU','1000001','JAPAN'),
(03,'JEEVAN','SHYONG','jeevan999@gmail.com','983483215','YHSETUJ','PARIS','FRANCE',75001,'FRANCE'),
(04,'SHARON','CS','sharon789@gmail.com','986712215','HKIYOU','BRISHBAIN','WALES','56098','AUSTRALLIA'),
(05,'NIYANA','NOKI','niyana021@gmail.com','987500005','GDSSDGG','ALASKA','RICO','231445','US'),
(06,'NABEEL','ABHI','nabeel11@gmail.com','989873215','QQWRYG','BELEM','BAHIA','11011','BRAZIL'),
(07,'TOMY','TOM','tomy5430@gmail.com','986709215','JKLIOVD','BERLIN','THURINGIA','781002','GERMANY'),
(08,'ASIF','ALI','asifl340@gmail.com','978743215','TYUI','DUBLIN','OHIO','200125','IRELAND');
SELECT *FROM CUSTOMER;

-- CREATING VIEWS
# create view named CUSTOMER_INFO for the CUSTOMER table that display CUSTOMERS FULL NAME and EMAIL adderess.Then perform SELECT operation for CUSTOMER_INFO view
 create view CUSTOMER_INFO 
 as select concat(FIRST_NAME,' ',LAST_NAME) as FULL_NAME,
 EMAIL from CUSTOMER;
 select * from CUSTOMER_INFO;
 
 # create a view named US_CUSTOMERS that dispalys customers loacated in the US
 create view US_CUSTOMERS as select * from CUSTOMER where COUNTRY='US';
 select * from US_CUSTOMERS;
 
# create view named CUSTOMER_DETAILS with columns full name
create view CUSTOMER_DETAILS as select concat(FIRST_NAME,'  ',LAST_NAME) as FULL_NAME,EMAIL,PHONE_NO,STATE from CUSTOMER;                 
select * from CUSTOMER_DETAILS;
 
# update the PHONE_NO of people who live in TAMILNADU
update CUSTOMER_DETAILS set PHONE_NO = '989897965' where STATE='TAMILNADU';
select * from CUSTOMER_DETAILS;
 
#  no of customers & show only states with more than 5 customers
 select STATE,count(*) as no_of_customers from CUSTOMER
group by STATE

having count(*)>5;

# query returning the no of customers in each state based on the STATE column in the CUSTOMER_DETAILS view
 select STATE,count(*) as no_of_customers from CUSTOMER_DETAILS
group by STATE;

# query that returns all the column from the CUSTOMER_DETAILS view, sorted by STATE column in ascsnding order
select * from CUSTOMER_DETAILS
order by STATE;

drop database products;

TRUNCATE  TABLE WORKER