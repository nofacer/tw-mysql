# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name

# 产生临时表1employee包含公司名称
# 产生临时表2选出公司ID和最高薪资
# 然后右JOIN选出最高的薪资对应人和公司

#答案：
SELECT employee.companyName, employee.name FROM 
(SELECT employee.*, company.companyName FROM Employee employee LEFT JOIN Company company ON employee.companyId = company.id) 
employee Right JOIN (SELECT companyId, max(salary) AS maxsal FROM Employee GROUP BY companyId) t ON t.maxsal = employee.salary AND employee.companyId = t.companyId;

#   结果
# +-------------+------------+
# | companyName | name       |
# +-------------+------------+
# | 'baidu'     | 'xiaoming' |
# | 'alibaba'   | 'xiaohong' |
# | 'tengxun'   | 'xiaozhi'  |
# +-------------+------------+