create database CompanyDB

create table Employee (
EmployeeID int primary key,
Firstname varchar(50) not null,
Lastname varchar(50),
salary decimal (10,2),
Department_ID int,
)

create table Department (
Department_ID int,
DepartmentName varchar(50),
ManagerID int
)

