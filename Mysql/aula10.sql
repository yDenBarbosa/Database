-- limit limita a quantidade de valores
-- offset desloca o cursor para exibir os resultados
select id, first_name, email as uemail
FROM users
where id between 50 and 100
order by id asc
-- limit 5;
-- limit 5 offset 3;
limit 3,5; -- mesma coisa que o exemplo acima. O offset neste caso, vem primeiro que o limite
-- limit 6,5;