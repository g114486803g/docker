#!/bin/bash

echo "拉取镜像请稍后.."
docker pull registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5

docker tag registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5 redis/cluster:v01

docker rmi registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5

mkdir -p /rdb/{7000,7001,7002,7003,7004,7005} 
docker run --rm --name redis7000 -v /rdb/7000:/var/lib/redis -p 7000:6379 -d redis/cluster:v01
docker run --rm --name redis7001 -v /rdb/7001:/var/lib/redis -p 7001:6379 -d redis/cluster:v01
docker run --rm --name redis7002 -v /rdb/7002:/var/lib/redis -p 7002:6379 -d redis/cluster:v01
docker run --rm --name redis7003 -v /rdb/7003:/var/lib/redis -p 7003:6379 -d redis/cluster:v01
docker run --rm --name redis7004 -v /rdb/7004:/var/lib/redis -p 7004:6379 -d redis/cluster:v01
docker run --rm --name redis7005 -v /rdb/7005:/var/lib/redis -p 7005:6379 -d redis/cluster:v01

no1=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7000`
no2=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7001`
no3=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7002`
no4=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7003`
no5=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7004`
no6=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7005`


echo "初始化集群"
docker exec -it redis7000 redis-cli  --cluster create  $no1:6379 $no2:6379 $no3:6379 $no4:6379 $no5:6379 $no6:6379 --cluster-replicas 1 

#echo docker exec -it redis7000 redis-cli  --cluster create  $no1:7000 $no2:7001 $no3:7002 $no4:7003 $no5:7004 $no6:7005 --cluster-replicas 1
echo `date`
echo "##########################"
