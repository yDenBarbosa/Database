 -- RAND() gera um valor aleatorio
 INSERT INTO users_roles (user_id, role_id)
 SELECT id,
 (SELECT id FROM roles ORDER BY RAND() LIMIT 1) AS qualquer
 FROM users u 