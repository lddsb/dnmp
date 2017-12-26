FROM mysql:latest

MAINTAINER Luo Di <luodi0128@gmail.com>

# set timezone to China
RUN echo "Asia/Shanghai" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

# set path permissions
RUN chown -R mysql:root /var/lib/mysql

# copy my.cnf into the MySQL container
ADD ./conf/my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
