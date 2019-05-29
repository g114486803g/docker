#!/bin/bash

#redis_role=$1
#sed -i 's/protected-mode yes/protected-mode no/g' /usr/local/redis/redis.conf
#sed -i 's/daemonize yes/daemonize no/g'           /usr/local/redis/redis.conf
#sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g'          /usr/local/redis/redis.conf

#sed -i 's/# slaveof <masterip> <masterport>/slaveof redis-master 6379/g' /usr/local/redis/redis.conf
/usr/local/redis/bin/redis-server /usr/local/redis/redis.conf
#sed -i 's/# slaveof <masterip> <masterport>/slaveof redis-master 6379/g' /usr/local/redis/redis.conf
