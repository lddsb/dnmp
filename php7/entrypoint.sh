#!/bin/sh
supervisord -c /etc/supervisord.conf
docker-php-entrypoint php-fpm
