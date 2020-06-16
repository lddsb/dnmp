#!/bin/sh
supervisord -c /etc/supervisor/supervisord.conf
docker-php-entrypoint php-fpm
