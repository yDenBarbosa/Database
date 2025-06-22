-- insert select
-- isere valores em uma tabela usando outra
insert into profiles 
(bio, description, user_id) 
SELECT
concat('Bio de ', first_name),
concat('Description de ', first_name),
id 
FROM users u 

delete from profiles;