# 1.创建数据库employee_db
CREATE DATABASE IF NOT EXISTS `employee_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

# 查看数据库是否创建成功
show databases;

# 进入到新创建的数据库
use employee_db;

# 2.在数据库employee_db中创建table：`Employee`
CREATE TABLE Employee(
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10),
    companyId INT NOT NULL,
    salary INT NOT NULL
) engine=InnoDB DEFAULT CHARSET = utf8;

# 3.将`employee-data.csv`文件中的数据导入数据表Employee中
LOAD DATA LOCAL INFILE '/Users/dustni/employee-data.csv' INTO TABLE Employee FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (id, name, age, gender, companyId, salary);

# 4.在数据库employee_db中创建table：`Company`
CREATE TABLE Company(
    id INT PRIMARY KEY,
    companyName VARCHAR(255) NOT NULL,
    employeesNumber INT NOT NULL
) engine=InnoDB DEFAULT CHARSET = gbk;

# 5.将`employee-data.csv`文件中的数据导入Company数据表中
LOAD DATA LOCAL INFILE '/var/sources/company-data.csv' INTO TABLE Company FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (id, companyName, employeesNumber);


# 6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息
SELECT * FROM Employee WHERE `name` LIKE '%n%' AND salary > 6000;
# 6结果展示
# +----+------------+-----+----------+-----------+--------+
# | id | name       | age | gender   | companyId | salary |
# +----+------------+-----+----------+-----------+--------+
# |  1 | 'xiaohong' |  19 | 'female' |         1 |   7000 |
# +----+------------+-----+----------+-----------+--------+
