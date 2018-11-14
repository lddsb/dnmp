FROM node:8-alpine

MAINTAINER Dee Luo <luodi0128@gmail.com> <https://github.com/lddsb>

# replace mirror
ARG CUSTOMIZE_MIRROR=dl-cdn.alpinelinux.org
ENV CUSTOMIZE_MIRROR ${CUSTOMIZE_MIRROR}
RUN if [ ${CUSTOMIZE_MIRROR} ]; then \
    sed -i "s/dl-cdn.alpinelinux.org/${CUSTOMIZE_MIRROR}/g" /etc/apk/repositories \
;fi
# mirror http scheme
ARG HTTPS_MIRROR=false
RUN if [ ${HTTPS_MIRROR} = true ]; then \
    sed -i "s/http:\/\//https:\/\//g" /etc/apk/repositories \
;else \
    sed -i "s/https:\/\//http:\/\//g" /etc/apk/repositories \
;fi

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# gulp
RUN yarn global add gulp

# compatible codepku platform
RUN apk add --no-cache alpine-sdk libnotify python

EXPOSE 8080
CMD ["npm", "start"]