#!/bin/sh
docker-php-entrypoint php-fpm
crond -f -l 8