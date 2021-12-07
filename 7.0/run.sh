#!/bin/bash

variables=( "PHP_FPM_USER" "PHP_FPM_PORT" "PHP_ERROR_REPORTING" "ENVIRONMENT" )

for var in "${variables[@]}"
do
   :
   sed -i "s|%$var%|${!var}|g" /etc/php/7.0/fpm/pool.d/www.conf
done

/usr/sbin/php-fpm7.0 --allow-to-run-as-root -c /etc/php/7.0/fpm --nodaemonize
