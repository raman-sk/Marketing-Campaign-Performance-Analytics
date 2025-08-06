select
city as "location",
CAST(population AS int) as "population"
from {{ source("data", "economics_data") }}