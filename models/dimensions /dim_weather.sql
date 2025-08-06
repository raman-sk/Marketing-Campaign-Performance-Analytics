with weather as (
    select
    location,
    date_time::date as date_value,
    avg(temperature_c) as temperature_c,
    avg(humidity_pct) as humidity_pct,
    avg(precipitation_mm) as precipitation_mm
    from {{ref('stg_weather')}}
    group by location, date_value
)

select row_number() over () as weather_dim_id, *
from weather