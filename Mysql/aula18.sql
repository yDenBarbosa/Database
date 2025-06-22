-- configura um salario aleatorio para a tabela 'users'
UPDATE users u SET salary = ROUND(RAND() * 10000, 2)
-- always use the UPDATE with the WHERE

SELECT salary FROM users u WHERE
salary BETWEEN 1000 AND 1500
ORDER BY salary ASC;
