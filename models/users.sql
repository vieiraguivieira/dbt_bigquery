-- select * from schema.users

select country, count(id) as users
from schema.users
group by country
order by count(id) desc