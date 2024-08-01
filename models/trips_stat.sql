SELECT 
COUNT(distinct id) as trips,
COUNT(distinct user_id) as users,
SUM(duration_s /60)/COUNT(distinct id) as avg_duration_m,
SUM(price_rub) as revenue_rub ,
cast(COUNT(distinct case when is_free  then id else null end) as float)/cast(COUNT(distinct id) as float)*100 as free_trips_pct ,
 SUM (distance_m)/1000 AS sum_distance_km 
FROM {{ ref("trips_prep") }}