-- QUERYING DATA
-- CREATING DATABASE
CREATE DATABASE INFORMATIONS;
USE INFORMATIONS;

-- CREATING TABLE 1
CREATE TABLE COUNTRY(
ID INT PRIMARY KEY,
COUNTRY_NAME VARCHAR(50),
POPULATION INT NOT NULL,
AREA FLOAT
);

-- CREATING TABLE 2
CREATE TABLE PERSONS(
ID INT ,
FNAME VARCHAR(50),
LNAME VARCHAR(50) ,
POPULATION INT NOT NULL,
RATING FLOAT CHECK(RATING IN(1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0)),
COUNTRY_ID  INT ,
COUNTRY_NAME VARCHAR(50)
);

-- INSERTING DATA TO TABLE 1
INSERT INTO COUNTRY (ID,COUNTRY_NAME ,POPULATION ,AREA)
VALUES
(1011,'INDIA',100000,77445.2),
(1012,'CHINA',400000,22458.9),
(1013,'US',50000,25658.5),
(1014,'CANADA',20000,12356.4),
(1015,'UK',1000000,9980.85),
(1016,'AUSTRALIA',1500000,69844.2),
(1017,'GERMANY',12000,85111.1),
(1018,'IRELAND',2000000,36581.1),
(1019,'POLAND',150000,13597.0),
(1020,'EUROPE',700000,5555.5);
SELECT *FROM COUNTRY;

-- INSERTING DATA TO TABLE 2
INSERT INTO PERSONS(ID,FNAME,LNAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME)
VALUES
(1,'ROCKY','MANTIN',100000,'3.5',1011,'INDIA'),
(2,'ZAMBIN','VIRNAN',400000,'2.0',1012,'CHINA'),
(3,'RAYAN','YOKUL',500000,'3.0',1013,'UK'),
(4,'MANVITHA','PRAKSHITH',2000000,'3.0',1014,'CANADA');
INSERT INTO PERSONS(ID,FNAME,LNAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME)
VALUE
(5,'ALASKA','ROSE',1000000,'1.0',1015,'OSLO');
INSERT INTO PERSONS(ID,FNAME,LNAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME)
VALUES
(6,'ABBERLLINA','ASHIQ',1500000,'1.5',1016,'AUSTRALIA'),
(7,'VINIYA','VINAY',1200000,'4.5',1017,'GERMANY'),
(8,'DELBEL','DALI',2000000,'5.0',1018,'US');
INSERT INTO PERSONS(ID,FNAME,LNAME,POPULATION,RATING,COUNTRY_ID,COUNTRY_NAME)
VALUES
(9,'BHOOMI','BODTHI',150000,'3.5',1019,'IRELAND'),
(10,'THONKHOI','CHOKNE',700000,'2.5',1020,'INDIA');
SELECT *FROM PERSONS;

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



