#!/bin/sh
crond -f -l 8 &
supervisord -c /etc/supervisord.conf &
docker-php-entrypoint php-fpm