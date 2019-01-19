#!/bin/sh

cd /var/www > /dev/null 2>&1 &
echo "COMPOSER INSTALL"
composer install

php artisan queue:table
php artisan session:table
php artisan migrate

exec "/usr/bin/supervisord"
