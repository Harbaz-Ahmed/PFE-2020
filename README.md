# carrental-docker-mysql-php

$ docker-compose up -d
$ docker-compose ps

# Change db connexion /incluses/config.php
# Create a user for Mysql 'carrentaluser' // The default MySQL installation only creates the root administrative account, which has 
unlimited privileges on the database server. In general, it’s better to avoid using the root administrative account when interacting 
with the database. Instead, let’s create a dedicated database user for our application’s Laravel database.
$ docker exec -ti carrental-db bash
$ mysql -uroot -p 
mysql> show databases;
mysql> GRANT ALL ON carrental.* TO 'carrentaluser'@'%' IDENTIFIED BY 'carrental123';
mysql> FLUSH PRIVILEGES;                          // Flush the privileges to notify the MySQL server of the changes
mysql > exit;

