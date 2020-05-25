import json
import boto3
import os
import subprocess
import sys

subprocess.check_call([sys.executable, "-m", "pip", "install", "--target", "/tmp", 'yfinance'])
sys.path.append('/tmp')

import yfinance as yf
def lambda_handler(event, context):
    
    tickers_list=["FB", "SHOP", "BYND", "NFLX", "PINS", "SQ", "TTD", "OKTA", "SNAP", "DDOG"]

    for ticker in range(len(tickers_list)):
        records=yf.download(tickers_list[ticker], start="2020-05-14", end="2020-05-15", interval="1m")
        data=[]
        
        for i in range(len(records)):
            data_dict={'high':records['High'][i],'low':records['Low'][i],'ts':records.index[i].strftime('%m-%d-%Y %X'),'name':tickers_list[ticker]}
            as_jsonstr=json.dumps(data_dict)
           
            fh=boto3.client("firehose","us-east-2")
            fh.put_record(
                DeliveryStreamName="datatransformer-delivery-stream",
                Record={"Data":as_jsonstr.encode('utf-8')})
                
            data.append(data_dict)
                
                
    return {
        'statusCode': 200,
        'body': json.dumps(f'Done! Recorded: {as_jsonstr}')
    }
    


 