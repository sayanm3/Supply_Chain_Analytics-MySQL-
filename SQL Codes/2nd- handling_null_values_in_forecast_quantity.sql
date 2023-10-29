SELECT * FROM fact_act_est;

update fact_act_est
set forecast_quantity = 0
where forecast_quantity is null;