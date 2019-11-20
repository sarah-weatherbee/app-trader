select *
from play_store_apps;
--10840 rows

select *
from app_store_apps;
--10840 rows

select round(avg(rating),2)
from play_store_apps;
--4.19

SELECT cast(TRIM('$' FROM price)as float) AS TrimmedPrice
from play_store_apps
order by TrimmedPrice desc;


select distinct a.name, 
       case when a.price <= 1.00 then 10000
	   else a.price * 10000
	   end as app_store_purchase_cost, 
       case when cast(replace(p.price, '$', '') as float) <= 1.00 then 10000
	   else cast(replace(p.price, '$', '') as float) * 10000
	   end as play_store_purchase_cost,
       (1+2*a.rating) * 60000 as total_app_revenue,
       ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5)+1) * 60000 as total_play_revenue,
	   a.primary_genre as app_genre,
	   p.genres as play_genre,
	   (1+2 * a.rating) * 12 * 500 as app_marketing_cost,
	   ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5) +1) * 12 * 500 as play_marketing_cost,
	   ((1+2*a.rating) * 60000 - (case when a.price <= 1.00 then 10000
	   else a.price * 10000	end) - (1+2 * a.rating) * 12 * 500) as app_net_earnings,
	   (ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5) +1) * 60000 - (case when cast(replace(p.price, '$', '') as float) <= 1.00 then 10000
	   else cast(replace(p.price, '$', '') as float) * 10000
	   end) - ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5) +1) * 12 * 500) as play_net_earnings,
	   ((1+2*a.rating) * 60000 - (case when a.price <= 1.00 then 10000
	   else a.price * 10000	end) - (1+2 * a.rating) * 12 * 500) + 
	   (ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5) +1) * 60000 - (case when cast(replace(p.price, '$', '') as float) <= 1.00 then 10000
	   else cast(replace(p.price, '$', '') as float) * 10000
	   end) - ROUND(((FLOOR(p.rating *2 + 0.5)/2)/.5) +1) * 12 * 500) as total_net_earnings
from app_store_apps as a 
join play_store_apps as p
on a.name = p.name
order by total_net_earnings desc;
 









 