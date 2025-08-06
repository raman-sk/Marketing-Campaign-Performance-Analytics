with dates as (
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2021-01-01' as date)",
    end_date="cast('2021-12-31' as date)"
   )
}}),

holidays as (
    select * from {{ ref('stg_holidays') }}
)

select row_number() over () as date_dim_id,
    date_day::date as date_value,
    date_part('month',date_day) as month,
    date_part('day',date_day) as date,
    date_part('year',date_day) as year,
    date_part(dow, date_day) as dayofweek,
    trim(to_char(date_day, 'day')) as dayname,
    holidays.holiday
from dates
left join holidays on dates.date_day = holidays.date_value