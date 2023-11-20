-- select * from schema.users
select country, count(id) as users
from schema.users
-- where age > 40
group by country
order by count(id) desc
