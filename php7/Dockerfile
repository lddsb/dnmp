FROM php:7.3-fpm

LABEL maintainer="Luo Di <luodi0128@gmail.com> <https://github.com/lddsb>"

# debian mirror
ARG CUSTOMIZE_MIRROR
RUN if [ ${CUSTOMIZE_MIRROR} ]; then \
    sed -i "s/deb.debian.org/${CUSTOMIZE_MIRROR}/g" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/${CUSTOMIZE_MIRROR}/g" /etc/apt/sources.list \
    ;fi

RUN apt-get update

# install php composer
ARG PHP_COMPOSER=false
RUN if [ "x${PHP_COMPOSER}" = "xtrue" ]; then \
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php\
    && rm composer-setup.php \
    && mv composer.phar /usr/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer \
    ;fi

# exists ctype curl date dom fileinfo filter ftp hash iconv libxml mbstring mysqlnd openssl pcre PDO pdo_sqlite Phar posix readline Reflection session SimpleXML SPL sqlite3 standard tokenizer xml xmlreader xmlwriter zlib

# install imap
#RUN apt-get install -y libc-client-dev libkrb5-dev && docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap && php -m

# install bz2
# RUN apt-get install -y libbz2-dev && docker-php-ext-install bz2

# install interbase
# RUN apt-get install -y firebird-dev && docker-php-ext-install interbase

# install intl
# RUN apt-get install -y zlib1g-dev libicu-dev g++ && docker-php-ext-install intl

# install ldap
# RUN apt-get install -y libldb-dev libldap2-dev && docker-php-ext-install ldap

# install mcrypt
# RUN apt-get install -y libmcrypt-dev libreadline-dev && docker-php-ext-install mcrypt

# install basic PHP extensions
# RUN install-php-extensions bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip

# gd extension
ARG PHP_EXT_GD=false
RUN if [ "x${PHP_EXT_GD}" = "xtrue" ]; then \
    apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    ;fi

# bcmath
ARG PHP_EXT_BCMATH
RUN if [ "x${PHP_EXT_BCMATH}" = "xtrue" ]; then \
    docker-php-ext-install bcmath \
    ;fi

# zip extension
ARG PHP_EXT_ZIP=false
RUN if [ "x${PHP_EXT_ZIP}" = "xtrue" ]; then \
    apt-get install -y \
    zlib1g-dev \
    libzip-dev unzip \
    && docker-php-ext-install zip \
    ;fi

# pdo_mysql extension
ARG PHP_EXT_MYSQL=false
RUN if [ "x${PHP_EXT_MYSQL}" = "xtrue" ]; then \
    docker-php-ext-install pdo_mysql \
    ;fi

# mongodb extension
ARG PHP_EXT_MONGODB
RUN if [ "x${PHP_EXT_MONGODB}" = "xtrue" ]; then \
    pecl install mongodb \
    && docker-php-ext-enable mongodb \
    ;fi

# swoole extension
ARG PHP_EXT_SWOOLE
RUN if [ "x${PHP_EXT_SWOOLE}" = "xtrue" ]; then \
    pecl install swoole \
    && docker-php-ext-enable swoole \
    ;fi

# hprose extension
ARG PHP_EXT_HPROSE
RUN if [ "x${PHP_EXT_HPROSE}" = "xtrue" ]; then \
    pecl install hprose \
    && docker-php-ext-enable hprose \
    ;fi

# redis extension
ARG PHP_EXT_REDIS
RUN if [ "x${PHP_EXT_REDIS}" = "xtrue" ]; then \
    pecl install -o -f redis \
    && docker-php-ext-enable redis \
    ;fi

# add supervisor && cron
RUN apt-get install -y supervisor procps cron
COPY ./entrypoint.sh /entrypoint.sh
RUN mkdir -p /var/log/cron \
    && chmod +x /entrypoint.sh

RUN apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
COPY ./conf/php.ini /usr/local/etc/php/php.ini
RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/' /usr/local/etc/php/php.ini
RUN ln -snf /usr/share/zoneinfo/$TZ > /etc/localtime

# web dir
WORKDIR /wwwroot

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 9000
