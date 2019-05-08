-- 取得每个company中最高薪水的人员名字
-- 输出结果包含公司名称和人员名称：companyName name
select t2.companyName,e.name from  
   ( select company,companyName,max(salary)  as salary
        from 
        (select e.name,e.company,c.companyName,e.salary from Employee e LEFT JOIN Company c on e.company=c.id order by salary) t1 
        group by companyName,company) t2 left join Employee e on t2.salary=e.salary and t2.company=e.company;