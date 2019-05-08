-- 找出薪水在公司的平均薪水之上的人员名字
--输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
-- id | name | age | gender | companyId | salary | companyName | avgsal
select e.id,e.name,e.age,e.sex as gender,e.company as companyId,e.salary,t2.companyName,t2.avgSalary as avgsal from 
(select company,companyName,avgSalary from 
(select company,avg(salary) as avgSalary from Employee group by company) as t left join Company c on t.company=c.id) as t2 right join Employee as e on t2.company=e.company
where e.salary>=avgSalary;