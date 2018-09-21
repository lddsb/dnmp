FROM php:7.1-fpm-alpine
MAINTAINER Luo Di luodi0128@gmail.com

# replace Chinese mirror
#COPY source.list /etc/apk/repositories
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# update apk
RUN apk update && apk upgrade

# install basic PHP extensions
RUN docker-php-ext-install mbstring opcache pdo pdo_mysql mysqli
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
    docker-php-ext-configure gd\
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-zlib-dir=/usr && \
        NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
        docker-php-ext-install -j${NPROC} gd zip && \
        apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev
COPY ./conf/php.ini /usr/local/etc/php/php.ini
RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/' /usr/local/etc/php/php.ini
RUN apk add --no-cache tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ > /etc/localtime
# install php composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
#COPY composer.phar /usr/bin/composer
#RUN chmod +x /usr/bin/composer \
#    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
#    && composer self-update
RUN apk --no-cache add shadow && usermod -u 1000 www-data
# web dir
WORKDIR /var/www/html

CMD ["php-fpm"]

EXPOSE 9000
