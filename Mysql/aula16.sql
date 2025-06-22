 -- LEFT JOIN considera todos os registros da tabela a esquerda, nesse acaso, a "users"
SELECT u.id AS uid, p.id AS pid,
p.bio, u.first_name
FROM users AS u
LEFT JOIN profiles p 
ON u.id = p.user_id
