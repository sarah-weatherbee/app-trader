select *
from play_store_apps
order by name;
--10840 rows

select *
from app_store_apps;
--10840 rows

select round(avg(rating),2)
from play_store_apps;
--4.19

SELECT TRIM('$' FROM price) AS TrimmedPrice, cast(TrimmedPrice as int)
from play_store_apps;




select name, cast(TRIM('$' FROM price) as int) AS TrimmedPrice, rating, round(rating/.5) + 1 as lifespan, primary_genre as genres 
case when price = 0.0 then 1.0 * 10000 else price * 10000
end as total_purchase_price
from app_store_apps
(select lifespan * 60000 as total_app_revenue
from app_store_apps);


--rating/.5 +1

from
(select 'play store' as platform, name, cast(TRIM('$' FROM price)as numeric) as price, rating, genres,
(1+2*rating) * 60000 as total_app_revenue,
 (1+2*rating) * 12 * 500 as marketing_cost,
 case when priceNum <= 1.00 then 10000 else price * 10000
 end as total_purchase_price
 from play_store_apps
 group by name, price, rating, genres) as moneys;


 