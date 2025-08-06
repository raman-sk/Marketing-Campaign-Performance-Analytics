select
location as "location",
date_time,
CAST(temperature_c AS int) as temperature_c,
CAST(humidity_pct AS int) as humidity_pct,
CAST(precipitation_mm AS int) as precipitation_mm
from {{ source("data", "weather_data") }}