-- 1: INSIRA 5 USUARIOS
-- 2: INSIRA 5 PERFIS PARA OS USUARIOS INSERIDOS
-- 3: INSIRA PERMISSÕES (ROLES) PARA OS USUARIOS INSERIDOS
-- 4: SELECIONE OS ULTIMOS 5 USUARIOS POR ORDEM DECRESCENTE
-- 5: ATUALIZE O ULTIMO USUARIO INSERIDO
-- 6: REMOVA UMA PERMISSAO DE ALGUM USUARIO
-- 7: REMOVA UM USUARIO QUE TEM A PERMISSÃO "PUT"
-- 8: SELECIONE USUARIOS COM PERFIS E PERMISSÕES (OBRIGATORIO)
-- 9: SELECIONE USUARIOS COM PERFIS E PERMISSÕES (OPCIONAL)
-- 10: SELECIONE USUARIOS COM PERFIS E PERMISSÕES ORDENANDO POR SALARIO

INSERT INTO users 
(first_name, last_name, email, passaword_hash, salary)
VALUES ('Vitoria', 'Fidelis', 'fidelisss@email.com', 'SADASDAAD', '52215'),
		('Isis', 'Toffolo', 'ibarbara@email.com', 'FDGCBVCSSDF', '5156'),
		('Abel', 'Ferreira', 'coachfer@email.com', 'VBNHJKFJID', '2156'),
		('Cristiano', 'Ronaldo', 'cr7@email.com', 'GKJGKPOJID', '52256'),
		('Gojo', 'Satoru', 'jujutsuka@email.com', 'ASDGFHFGJID', '52216')
		
-- INSERT INTO users 
-- (first_name, last_name, email, passaword_hash, salary)
-- VALUES ('Vitoria', 'Fidelis', 'fidelisss@email.com', ROUND(RAND() * 100000), ROUND(RAND() * 100000, 2)),
--		('Isis', 'Toffolo', 'ibarbara@email.com', ROUND(RAND() * 100000), ROUND(RAND() * 100000, 2)),
--		('Abel', 'Ferreira', 'coachfer@email.com', ROUND(RAND() * 100000), ROUND(RAND() * 100000, 2)),
--		('Cristiano', 'Ronaldo', 'cr7@email.com', 'ROUND(RAND() * 100000), ROUND(RAND() * 100000, 2)),
--		('Gojo', 'Satoru', 'jujutsuka@email.com', 'ROUND(RAND() * 100000), ROUND(RAND() * 100000, 2))
	
INSERT IGNORE INTO profiles 
(bio, description, user_id )
SELECT
CONCAT('Bio de ', first_name),
CONCAT('Description de ', first_name),
id
FROM users


-- INSERT INTO profiles 
-- (bio, description, user_id )
-- VALUES
-- ('Uma bio', 'Uma description', (SELECT id FROM users WHERE email = 'fidelisss@email.com')),
-- ('Uma bio', 'Uma description', (SELECT id FROM users WHERE email = 'ibarbara@email.com')),
-- ('Uma bio', 'Uma description', (SELECT id FROM users WHERE email = 'coachfer@email.com')),
-- ('Uma bio', 'Uma description', (SELECT id FROM users WHERE email = 'cr7@email.com')),
-- ('Uma bio', 'Uma description', (SELECT id FROM users WHERE email = 'jujutsuka@email.com'))


-- INSERT IGNORE INTO users_roles 
-- (user_id, role_id )
-- SELECT id,
-- (SELECT id FROM roles ORDER BY RAND() LIMIT 1)
-- FROM users ORDER BY RAND() LIMIT 10

INSERT INTO users_roles (user_id, role_id ) VALUES
(
	(SELECT id FROM users WHERE email = 'cr7@email.com'),
	(SELECT id FROM roles WHERE name = 'PUT')
),
(
	(SELECT id FROM users WHERE email = 'coachfer@email.com'),
	(SELECT id FROM roles WHERE name = 'PUT')
),
(
	(SELECT id FROM users WHERE email = 'ibarbara@email.com'),
	(SELECT id FROM roles WHERE name = 'PUT')
),
(
	(SELECT id FROM users WHERE email = 'fidelisss@email.com'),
	(SELECT id FROM roles WHERE name = 'PUT')
),
(
	(SELECT id FROM users WHERE email = 'jujutsuka@email.com'),
	(SELECT id FROM roles WHERE name = 'PUT')
);

SELECT * FROM users ORDER BY id DESC LIMIT 5

UPDATE users u SET first_name = 'Gojo Satoru', last_name = 'Atualizado' WHERE id = 119

DELETE FROM users_roles WHERE
user_id = (SELECT id FROM users WHERE email = 'cr7@email.com') AND 
role_id = (SELECT id FROM roles WHERE name = 'POST')

-- SELECT u.id AS uid, u.first_name, r.name 
DELETE u
FROM users u 
INNER JOIN users_roles ur ON u.id = ur.user_id
INNER JOIN roles r ON ur.role_id = r.id
WHERE r.name = 'PUT' AND u.id = 116


SELECT u.id AS uid, u.first_name, r.name
FROM users u 
INNER JOIN users_roles ur ON u.id = ur.user_id
INNER JOIN roles r ON ur.role_id = r.id
INNER JOIN profiles p ON p.user_id = u.id


SELECT u.id AS uid, u.first_name, r.name, u.salary
FROM users u 
INNER JOIN users_roles ur ON u.id = ur.user_id
INNER JOIN roles r ON ur.role_id = r.id
INNER JOIN profiles p ON p.user_id = u.id
ORDER BY u.salary DESC