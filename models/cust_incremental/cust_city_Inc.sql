{{ config( materialized = 'incremental',
           unique_key='CustomerID',
           on_schema_change='append_new_columns'
        )
}}
select 
    CustomerID,
    Name,
    City,
    Updated_at,
    'A' as BK
    FROM {{ source( 'cust_city' , 'src_cust_city_1' )}}
    {% if is_incremental() %}
    where Updated_at > ( select MAX( Updated_at) from {{ this }} WHERE BK IN ('A')) 
    {% endif %}

union all

select 
    CustomerID,
    Name,
    City,
    Updated_at,
    'B' as BK
    FROM {{ source( 'cust_city' , 'src_cust_city_2' )}}
    {% if is_incremental() %}
    where Updated_at > ( select MAX( Updated_at) from {{ this }} WHERE BK IN ('B')) 
    {% endif %}
