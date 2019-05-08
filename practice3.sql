-- 取得平均薪水最高的公司
-- 输出公司名称和平均薪水:companyName avgSalary
select companyName,avgSalary from 
(select company,avg(salary) as avgSalary from Employee group by company) as t left join Company c on t.company=c.id;

