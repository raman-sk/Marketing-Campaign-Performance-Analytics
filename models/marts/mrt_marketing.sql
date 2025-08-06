with fct_marketing as (
    select * from {{ ref('fct_marketing') }}
),

dim_weather as (
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
)

select
dim_marketing.campaign_id,
dim_marketing.company,
dim_marketing.campaign_type,
dim_marketing.target_audience,
dim_marketing.duration,
dim_marketing.channel_used,
dim_marketing.location as "location",
dim_marketing.language as "language",

fct_marketing.population,
fct_marketing.temperature_c,
fct_marketing.humidity_pct,
fct_marketing.precipitation_mm,
fct_marketing.spend,
fct_marketing.revenue,
fct_marketing.clicks,
fct_marketing.impressions,

dim_date.holiday,
dim_date.date_value,
dim_date.month,
dim_date.date,
dim_date.year,
dim_date.dayofweek,
dim_date.dayname

from fct_marketing
left join dim_marketing on 
    fct_marketing.marketing_dim_id = dim_marketing.marketing_dim_id
left join dim_date on 
    fct_marketing.date_dim_id = dim_date.date_dim_id