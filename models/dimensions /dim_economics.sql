with economics as (
    select * from {{ref('stg_economics')}}
)

select row_number() over () as economics_dim_id, *
from economics