FROM node:8-alpine

MAINTAINER Dee Luo <luodi0128@gmail.com> <https://github.com/lddsb>

# replace Alpine Chinese mirror
#COPY source.list /etc/apk/repositories
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

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