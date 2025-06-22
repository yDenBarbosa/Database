SELECT  
MAX(salary) AS max_salary,
MIN(salary) AS min_salary, 
AVG(salary) AS avg_salary,
SUM(salary) AS sum_salary,
COUNT(salary) AS count_salary
FROM users u
WHERE first_name = 'Carly'