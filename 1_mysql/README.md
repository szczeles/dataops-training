# Benchmark MySQL in analytical use cases

## Data source

https://archive.org/details/stackexchange

Dump of stackoverflow data, `Badges.xml`

## Start MySQL

    docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -v /c:/data -d mysql:latest --secure-file-priv=/data

## Connect to MySQL

    sudo docker exec -ti some-mysql mysql -pmy-secret-pw

## Load data

```
create database stackoverflow DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

use stackoverflow;

create table Badges (
  Id INT NOT NULL PRIMARY KEY,
  UserId INT,
  Name VARCHAR(50),
  Date DATETIME,
  Class SMALLINT,
  TagBased VARCHAR(5)
);
load xml infile '/data/Badges.xml'
into table Badges
rows identified by '<row>';
```

How long does it take to import the set?

## Sample queries

* Number of records
* Top 10 users with the most badges
* Top 10 users with the most gold badges

Does it help if the index is added? Like `create index user_id on Badges (UserId);`

## Analytical queries

* What was the first tag-based badge for each user? 
   * What was the most popular one?
* How long did it take to get 10 badges starting from the first badge? 
   * Who was the fastest?

## Diagnostics

* `explain`
* current processes list
* slow queries log: `SET GLOBAL slow_query_log = 'ON'; SET GLOBAL slow_query_log_file = '/tmp/slow_queries';`
