with forcast_accuracy_tab as (SELECT 
     s.customer_code,
     sum(s.sold_quantity) as total_sold_quantity,
     sum(forecast_quantity-sold_quantity) as net_error,
     sum((forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as net_error_pct,
     sum(abs(forecast_quantity-sold_quantity)) as abs_error,
	 sum(abs(forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as abs_error_pct
FROM gdb0041.fact_act_est s 
where fiscal_year = 2021 
group by customer_code
order by abs_error_pct)
select 
       e.*,
       c.customer,
       c.market,
        if (abs_error_pct > 100 , 0, 100-abs_error_pct) as forcast_accuracy
	from forcast_accuracy_tab e
    join dim_customer c
    using(customer_code)
    order by forcast_accuracy desc;