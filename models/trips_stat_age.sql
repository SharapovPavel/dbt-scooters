with sub as (
select date(started_at) as day,
extract(year from started_at) - extract(year from birth_date) as age,
COUNT(distinct t.id) as trips
FROM dev_uik9.scooters_raw.trips t
inner join dev_uik9.scooters_raw.users u on t.user_id=u.id
group by 1,2)
select age,
avg(trips) as avg_trips
from sub
group by 1