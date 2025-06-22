SELECT u.id AS uid, u.first_name, p.bio, r.name
FROM users AS u
LEFT JOIN profiles AS p ON u.id = p.user_id
INNER JOIN users_roles AS ur ON u.id = ur.user_id
INNER JOIN roles AS r ON ur.role_id = r.id 
WHERE u.id = 90
ORDER BY uid ASC
LIMIT 0,1