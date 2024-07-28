SELECT 
COUNT(distinct id) as trips,
COUNT(distinct user_id) as users,
SUM(extract(EPOCH from (finished_at-started_at))/60)/COUNT(distinct id) as avg_duration_m,
SUM(price)/100 as revenue_rub ,
cast(COUNT(distinct case when price=0 then id else null end) as float)/cast(COUNT(distinct id) as float)*100 as free_trips_pct 
FROM dev_uik9.scooters_raw.trips