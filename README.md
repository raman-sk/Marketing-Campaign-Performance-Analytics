# Marketing-Campaign-Performance-Analytics

Implemented an AWS Redshift star-schema warehouse with dbt.

Unified several data sources into analyst-ready models and built live KPI dashboards.


Schema: fact table (fact_join_tbl).
dim_marketing, dim_economics, dim_weather, dim_date.

Grain: one marketing-campaign day per location.

Use-case: analyze campaign performance