select first_name, count(id) as total from users u 
group by first_name 
ORDER by total desc

select u.first_name, count(u.id) as total from users as u 
join profiles as p
on p.user_id = u.id
group by first_name 
order by total desc
limit 8
