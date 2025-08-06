with dim_weather as (
    select * from {{ ref('dim_weather') }}
),

dim_economics as (
    select * from {{ ref('dim_economics') }}
),

dim_date as (
    select * from {{ ref('dim_date') }}
),

dim_marketing as (
    select * from {{ ref('dim_marketing') }}
),

join_tbl as (
    select 
    dim_marketing.marketing_dim_id, 
    dim_economics.economics_dim_id, 
    dim_weather.weather_dim_id,
    dim_date.date_dim_id,

    dim_economics.population,
    
    dim_weather.temperature_c,
    dim_weather.humidity_pct,
    dim_weather.precipitation_mm,

    dim_marketing.spend,
    dim_marketing.revenue,
    dim_marketing.clicks,
    dim_marketing.impressions

    from dim_marketing

    left join dim_economics on 
        dim_marketing.location = dim_economics.location

    left join dim_weather on 
        dim_marketing.location = dim_weather.location
        and dim_marketing.date_value = dim_weather.date_value

    left join dim_date on 
        dim_marketing.date_value = dim_date.date_value
)

select row_number() over () as unique_key_dd, *
from join_tbl