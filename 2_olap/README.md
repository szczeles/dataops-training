# Druid as example of OLAP database

## Getting druid (Imply distribution)

    docker run -p 9095:9095 -d --name imply imply/imply

## Load the data

1. HTTP Sourcce
2. Url: https://github.com/szczeles/dataops-training/blob/master/2_olap/badges-sample.csv.gz?raw=true - badges assigned during 2019, 2.9M rows
3. Backup url:  http://aruba4.zailesprzedam.pl:6002/badges-sample.csv.gz

## Examine the data

1. How many users got the tag-based gold or silver badge in May?
1. Look for anomalies. Find the root cause.
