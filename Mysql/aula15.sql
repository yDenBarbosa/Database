-- INNER JOIN considera os registros que tem relacionamente entre as tabelas 'users' e a 'profiles'
SELECT u.id AS uid, p.id AS pid,
p.bio, u.first_name
FROM users AS u
INNER JOIN profiles p 
ON u.id = p.user_id
WHERE u.first_name LIKE '%a'
ORDER BY u.first_name DESC
LIMIT 10