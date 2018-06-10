FROM mysql:5.7

MAINTAINER Luo Di <luodi0128@gmail.com>

# set timezone to China
ENV TIMEZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# set path permissions
RUN chown -R mysql:mysql /var/lib/mysql/

# copy my.cnf into the MySQL container
ADD ./conf/my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
