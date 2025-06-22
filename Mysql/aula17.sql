 -- LEFT JOIN considera todos os registros da tabela a dereita, nesse acaso, a "profiles"
SELECT u.id AS uid, p.id AS pid,
p.bio, u.first_name
FROM users AS u
RIGHT JOIN profiles p 
ON u.id = p.user_id
