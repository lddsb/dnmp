FROM nginx:alpine

LABEL maintainer="Luo Di <luodi0128@gmail.com> <https://github.com/lddsb>"

# define variable
ARG CUSTOMIZE_MIRROR
# replace mirror
RUN if [ ${CUSTOMIZE_MIRROR} ]; then \
    sed -i "s/dl-cdn.alpinelinux.org/${CUSTOMIZE_MIRROR}/g" /etc/apk/repositories \
    ;fi
# add openssl for support http2
RUN apk update && apk --no-cache add openssl

ARG PHP_UPSTREAM_CONTAINER_7=php7
ARG PHP_UPSTREAM_PORT=9000

RUN mkdir -p /scripts
COPY adduser.sh /scripts

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && sh /scripts/adduser.sh



# Set upstream conf and remove the default conf
RUN echo "upstream php7 { server ${PHP_UPSTREAM_CONTAINER_7}:${PHP_UPSTREAM_PORT}; }" >> /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
