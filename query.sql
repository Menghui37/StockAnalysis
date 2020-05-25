Select max(high) as Hourly_high,name,DATE_TRUNC('hour',
   Coalesce(
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d/%m/%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d-%m-%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y'))
    ))as hour
From myh_yf_streamdata
group by name,DATE_TRUNC('hour',
   Coalesce(
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d/%m/%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d-%m-%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y'))
    ))
order by name,DATE_TRUNC('hour',
   Coalesce(
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d/%m/%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%d-%m-%Y %H:%i:%s')),
     try(date_parse(myh_yf_streamdata.ts, '%Y-%m-%d')),
     try(date_parse(myh_yf_streamdata.ts, '%Y/%m/%d')),
     try(date_parse(myh_yf_streamdata.ts, '%d %M %Y'))
    )) asc