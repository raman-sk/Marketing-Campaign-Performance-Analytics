select
date_value,
holiday,
weekday_name,
month_num,
day_num,
year_num
from {{ source("data", "holidays_data") }}