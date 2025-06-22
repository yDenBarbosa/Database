-- in seleciona elementos entre os valores enviados
SELECT * FROM  users u 
-- where id=100 or id=115 or id=120;
where id in (50, 77, 82, 100)
and first_name in ('Blythe');