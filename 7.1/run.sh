#!/bin/bash

variables=( "PHP_FPM_USER" "PHP_FPM_PORT" "PHP_ERROR_REPORTING" "ENVIRONMENT" )

for var in "${variables[@]}"
do
   :
   sed -i "s|%$var%|${!var}|g" /etc/php/7.1/fpm/pool.d/www.conf
done

/usr/sbin/php-fpm7.1 --allow-to-run-as-root -c /etc/php/7.1/fpm --nodaemonize