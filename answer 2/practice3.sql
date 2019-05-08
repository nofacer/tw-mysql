#取得平均薪水最高的公司
#输出公司名称和平均薪水：companyName avgSalary

#先算出公司的平均薪资水平选出最高的薪资
# SELECT companyId, avg(salary) AS avgsal FROM Employee GROUP BY companyId ORDER BY avgsal DESC LIMIT 1;

#答案：
SELECT B.companyName, A.avgsal FROM (SELECT companyId, avg(salary) AS avgsal FROM Employee GROUP BY companyId) A INNER JOIN Company B ON A.companyId=B.id

#结果：
# +-------------+-----------+
# | companyName | avgsal    |
# +-------------+-----------+
# | 'baidu'     | 5000.0000 |
# | 'alibaba'   | 6500.0000 |
# | 'tengxun'   | 8000.0000 |
# +-------------+-----------+