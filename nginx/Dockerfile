FROM nginx:alpine

LABEL maintainer="Luo Di <luodi0128@gmail.com> <https://github.com/lddsb>"

# define variable
ARG CUSTOMIZE_MIRROR
# replace mirror
RUN if [ ${CUSTOMIZE_MIRROR} ]; then \
    sed -i "s/dl-cdn.alpinelinux.org/${CUSTOMIZE_MIRROR}/g" /etc/apk/repositories \
    ;fi
# define variable
ARG HTTPS_MIRROR=false
# mirror http scheme
RUN if [ ${HTTPS_MIRROR} = true ]; then \
    sed -i "s/http:\/\//https:\/\//g" /etc/apk/repositories \
    ;else \
    sed -i "s/https:\/\//http:\/\//g" /etc/apk/repositories \
    ;fi

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
