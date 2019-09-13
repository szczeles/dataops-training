# Jupyter & spark

## Stackoverflow data conversion

https://github.com/szczeles/pyspark-notebooks/blob/master/stackoverflow/stackexchange-convert.ipynb


## Hive table create

```
CREATE EXTERNAL TABLE `stackoverflow`.`badges`(`Id` INT, `UserId` INT, `Name` STRING, `Date` TIMESTAMP, `Class` INT, `TagBased` BOOLEAN)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
)
STORED AS
  INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION 'hdfs://namenode:9000/data/stackoverflow/parquet/Badges'
TBLPROPERTIES (
  'transient_lastDdlTime' = '1568273882'
)
```
