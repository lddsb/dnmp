FROM mysql:5.7

LABEL maintainer="Luo Di <luodi0128@gmail.com> <https://github.com/lddsb>"

# set timezone to China
ENV TIMEZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# set path permissions
RUN chown -R mysql:mysql /var/lib/mysql/

CMD ["mysqld"]

EXPOSE 3306
