-- DDL COMMANDS
#1.creating database
create database school;
use school;
create table STUDENTS(
Roll_Number int auto_increment key , 
Name varchar(50) not null,
Marks int,
Grade char(1) check(Grade in('A','B','C'))
);
desc STUDENTS;


-- INSERTING VALUES TO TABLE
-- DML
# adding values to STUDENT table
INSERT INTO STUDENTS(Roll_Number,Name,Marks,Grade)
values
(1,'BEL',90,'B');
 select * from STUDENTS;
INSERT INTO STUDENTS(Roll_Number,Name,Marks,Grade)
values 
 (2,'CEL',99,'A');       
INSERT INTO STUDENTS(Roll_Number,Name,Marks,Grade)
values 
 (3,'DEL',84,'B');
 INSERT INTO STUDENTS(Roll_Number,Name,Marks,Grade)
values 
 (4,'NEL',91,'A');
 select * from STUDENTS;
 
 -- adding a column to STUDENTS table using alter
alter table STUDENTS add contact varchar(15);
desc STUDENTS;


-- deleting a column using drop
alter table STUDENTS drop Grade;
desc STUDENTS;

-- rename the table
rename table STUDENTS to CLASSTEN;
desc CLASSTEN;
 
-- truncate the table
truncate table CLASSTEN;
desc CLASSTEN;

-- remove the table
drop table CLASSTEN;
desc CLASSTEN;

drop database school;

 
 
