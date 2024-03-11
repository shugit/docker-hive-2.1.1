#!/bin/bash
# 下载MySQL JDBC驱动
curl -o /opt/hive/lib/mysql-connector-java-5.1.49.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar
# 初始化Hive Metastore的schema

/opt/hive/bin/schematool -dbType mysql -initSchema
# 启动Hive Metastore服务
#/opt/hive/bin/hive --service metastore
