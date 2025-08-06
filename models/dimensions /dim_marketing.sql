with marketing as (
    select * from {{ref('stg_marketing_campaigns')}}
)

select row_number() over () as marketing_dim_id, marketing.*
from marketing