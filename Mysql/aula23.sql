-- atualiza registros com joins
select u.first_name, p.bio from users u 
inner join profiles as p
on p.user_id = u.id
where u.first_name = 'Xanthus'

update users as u
inner join profiles as p
on p.user_id = u.id
set p.bio = concat(p.bio, ' atualizado')
where u.first_name = 'Xanthus'