SELECT name, max(high)as hourhigh,date_trunc('hour',date_parse(ts,
         '%m-%d-%Y %H:%i:%s')) as exacthr
FROM financedatatransform
group by name,date_trunc('hour',date_parse(ts,
         '%m-%d-%Y %H:%i:%s')) 
order by name, date_trunc('hour',date_parse(ts,
         '%m-%d-%Y %H:%i:%s')) asc
