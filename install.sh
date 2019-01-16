#!/bin/sh

echo "INSTALL MISSING PACKAGES"
cd /var/www > /dev/null 2>&1 &
apt-get update -y
apt-get install -y php7.0-curl
apt-get install -y vim

echo "COMPOSER INSTALL"
composer install

php artisan:migrate
php artisan queue:table
php artisan:migrate

exec "/usr/bin/supervisord"
