#!/bin/sh
user=www-data
group=www-data

# create group if not exists
egrep "^$group" /etc/group >& /dev/null
if [ $? -ne 0 ]
then
    addgroup $group
fi

# create user if not exists
egrep "^$user" /etc/passwwd >& /dev/null
if [ $? -ne 0 ]
then
    adduser -D -H -s /bin/bash -G $group $user
fi
