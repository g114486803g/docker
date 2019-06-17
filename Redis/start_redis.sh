#!/bin/bash

redis_role=$1
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf
sed -i 's/daemonize yes/daemonize no/g'           /etc/redis.conf
sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g'          /etc/redis.conf

echo "Start Redis by "
if [ $redis_role = "master" ]; then
    echo "master"
    echo "requirepass 123000" >> /etc/redis.conf
    redis-server /etc/redis.conf
elif [ $redis_role = "slave" ]; then
    echo "slave"
    sed -i 's/# slaveof <masterip> <masterport>/slaveof redis-master 6379/g' /etc/redis.conf
    echo "masterauth  123000"  >> /etc/redis.conf
    redis-server /etc/redis.conf
else
    echo "unknow role!"
fi
