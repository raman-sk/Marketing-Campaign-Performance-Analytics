select
campaign_id,
company,
campaign_type,
target_audience,
duration,
channel_used,
cast(replace(replace(spend,  '$', ''), ',', '') as numeric(12,2) ) as spend,
cast(replace(replace(revenue,'$', ''), ',', '') as numeric(12,2) ) as revenue,
location as "location",
language as "language",
cast(clicks AS float) as clicks,
cast(impressions AS float) as impressions,
engagement_score,
customer_segment,
date::date as date_value
from {{ source("data", "marketing_campaign_data") }}