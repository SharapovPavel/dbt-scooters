select date(started_at),
COUNT(distinct id) as trips,
MAX(price)/100 as max_price_rub,
avg(distance)/1000 as avg_distance_km 
FROM dev_uik9.scooters_raw.trips
group by date(started_at)