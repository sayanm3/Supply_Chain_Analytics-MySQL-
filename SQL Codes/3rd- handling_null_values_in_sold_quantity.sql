SELECT * FROM fact_act_est;

update fact_act_est
set sold_quantity = 0
where sold_quantity is null;