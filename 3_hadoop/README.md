# HDFS

# YARN

## Running example

```
yarn jar /opt/hadoop-2.7.4/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.4.jar pi 16 1000
```

# Hive

## Connecting via JDBC

```
beeline -u 'jdbc:hive2://localhost:10000'
```

## Sample data load 

```
CREATE TABLE pokes (foo INT, bar STRING);
LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
```

# Hive-compatible query

```
select Name, count(*) as cnt from (
  select UserId, Name, row_number() over (PARTITION BY UserId ORDER BY `Date`) as age 
  from Badges where not TagBased 
) ttt where age=1 group by Name order by cnt desc limit 10;
```
