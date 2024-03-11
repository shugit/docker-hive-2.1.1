[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/big-data-europe/Lobby)

# docker-hive

This is a docker container for Apache Hive 2.1.1. 
It is based on https://github.com/big-data-europe/docker-hadoop and https://github.com/big-data-europe/docker-hive so check there for Hadoop configurations.
This deploys Hive and starts a hiveserver2 on port 10000.
Metastore is running with a connection to Mysql 5.7.41 database.
The hive configuration is performed with HIVE_SITE_CONF_ variables (see hadoop-hive.env for an example).
Run
```
    docker build -t hive-mysql:5.7.41 --platform linux/amd64 -f Dockerfile-mysql .
```
and 
```
    docker build -t hive:2.1.1 --platform linux/amd64 .
```
To run Hive with mysql metastore:
```
    docker-compose up -d
```

To run a PrestoDB 0.181 with Hive connector:

```
  docker-compose up -d presto-coordinator
```

This deploys a Presto server listens on port `8080`

## Testing
Load data into Hive:
```
  $ docker-compose exec hive-server bash
  # /opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
  > CREATE TABLE pokes (foo INT, bar STRING);
  > LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
```

Then query it from PrestoDB. You can get [presto.jar](https://prestosql.io/docs/current/installation/cli.html) from PrestoDB website:
```
  $ wget https://repo1.maven.org/maven2/io/prestosql/presto-cli/308/presto-cli-308-executable.jar
  $ mv presto-cli-308-executable.jar presto.jar
  $ chmod +x presto.jar
  $ ./presto.jar --server localhost:8080 --catalog hive --schema default
  presto> select * from pokes;
```

## Contributors
* Shuwen [@shugit](https://github.com/shugit) (maintainer)
