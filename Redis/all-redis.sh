#!/bin/bash

docker pull registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:alpine-v02
docker tag registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:alpine-v02 alpine:v02 
docker build -t redis/alpine:v5.0.5 .
docker run --rm -itd -v /db/7000:/var/lib/redis --name master-redis -p7000:6379 redis/alpine:v5.0.5 master
docker run --rm -itd -v /db/7001:/var/lib/redis --name node1 --link master-redis:master-redis -p7001:6379 redis/alpine:v5.0.5 slave


echo "主从密码12300"
echo "主端口7000 从端口7001"

echo "需手动设置从节点加入matser如下: "
cat << EOF
# redis-cli -h 172.16.8.244 -p 7001
172.16.8.244:7001> KEYS *
(empty list or set)

4.做主节点的slave。
172.16.8.244:7001> SLAVEOF 172.17.0.2 6379
OK
172.16.8.244:7001> KEYS *
1) "jjjj"

EOF
