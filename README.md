# Stock Analysis
## Stock data of ten companies were collected for analysis. The data is composed of stock name, timestamp, high and low stock price for every minute from May 14th, 2020 9:30am to May 14th, 2020 4:00pm. Data was obtained using AWS lambda and Kinesis Data Firehose delivery streams and downloaded in a s3 folder for AWS Athena query. 
### The lambda function url for API gateway trigger is 
https://3akihli6c5.execute-api.us-east-2.amazonaws.com/default/datacollectorfunc

### Configuration for Datacollector Lambda Funcion 

![image](https://user-images.githubusercontent.com/57785809/82773134-4f476b00-9e0f-11ea-80d2-16563c7841f4.png)

### Kinesis Data Firehose Delivery Stream Monitoring 

![image](https://user-images.githubusercontent.com/57785809/82773075-21622680-9e0f-11ea-9732-7ab609da6cbf.png)
