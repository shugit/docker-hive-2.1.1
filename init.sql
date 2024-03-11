CREATE DATABASE metastore;
CREATE USER 'hive'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON metastore.* TO 'hive'@'%';
FLUSH PRIVILEGES;