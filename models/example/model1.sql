select
    o_orderdate order_date,
    sum(o_totalprice) total_price_of_house
from 
"SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
group by order_date
--add comments
