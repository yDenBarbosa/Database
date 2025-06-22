-- where filtra registros
-- operadores de comparação = < <= > >= <> !=
-- operadores lógicos and e ou
select * from users u 
-- where id=5;
-- where id>5;
-- where first_name = ""
-- where created_at < '2025-04-15 22:20:47';
where created_at < '2025-04-15 22:20:47' 
-- and id <= 1;
or id > 1;
