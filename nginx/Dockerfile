FROM nginx:alpine

MAINTAINER Luo Di <luodi0128@gmail.com>

# replace Chinese mirror
#COPY source.list /etc/apk/repositories
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# add the configuration file into container
ADD ./nginx.conf /etc/nginx/nginx.conf

ARG PHP_UPSTREAM_CONTAINER_7=php7
ARG PHP_UPSTREAM_PORT=9000

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

# Set upstream conf and remove the default conf
RUN echo "upstream php7 { server ${PHP_UPSTREAM_CONTAINER_7}:${PHP_UPSTREAM_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
