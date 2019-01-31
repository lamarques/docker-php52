# PHP5.2 Docker

Docker with Centos 5, PHP 5.2, Apache 2.2
php-pgsql and php-pdo_pgsql

##Example

```
docker run -d -p 8080:80 --name php52 -v www/:/var/www/html/ lamarques/php52-apache

```
