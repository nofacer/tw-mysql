--1.创建数据库employee_db
CREATE DATABASE employee_db;
--2.在数据库employee_db中创建table：`Employee`
create table Employee(
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    sex VARCHAR(10) NOT NULL,
    company INT NOT NULL,
    salary INT NOT NULL
);
--3.将`employee-data.csv`文件中的数据导入数据表Employee中
set global local_infile=1;
LOAD DATA LOCAL INFILE '/Users/dustni/employee-data.csv' 
INTO TABLE Employee 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
(id, name, age, sex, company, salary);
--4.在数据库employee_db中创建table：`Company`
CREATE TABLE Company(
    id INT PRIMARY KEY,
    companyName VARCHAR(255) NOT NULL,
    employeesNumber INT NOT NULL
);
--5.将`company-data.csv`文件中的数据导入Company数据表中
LOAD DATA LOCAL INFILE '/Users/dustni/company-data.csv' 
INTO TABLE Company 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
(id, companyName, employeesNumber);
--6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息
SELECT * FROM Employee WHERE `name` LIKE '%n%' AND salary > 6000;
--ps:本练习中只需要将6的结果复制到`result.txt`文件中