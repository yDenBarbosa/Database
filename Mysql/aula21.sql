-- IGNORE ignora erros que venha acontecer 
 INSERT IGNORE INTO users_roles (user_id, role_id)
 SELECT id,
 (SELECT id FROM roles ORDER BY RAND() LIMIT 1) AS qualquer
 FROM users ORDER BY RAND() LIMIT 5