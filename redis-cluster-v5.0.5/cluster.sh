#!/bin/bash

echo "拉取镜像请稍后.."
docker pull registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5

docker tag registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5 redis/cluster:v01

docker rmi registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:rdis-cluster-v5.0.5

mkdir -p /rdb/{7700,7701,7702,7703,7704,7705} 
docker run --rm --name redis7700 -v /rdb/7700:/var/lib/redis -p 7700:6379 -d redis/cluster:v01
docker run --rm --name redis7701 -v /rdb/7701:/var/lib/redis -p 7701:6379 -d redis/cluster:v01
docker run --rm --name redis7702 -v /rdb/7702:/var/lib/redis -p 7702:6379 -d redis/cluster:v01
docker run --rm --name redis7703 -v /rdb/7703:/var/lib/redis -p 7703:6379 -d redis/cluster:v01
docker run --rm --name redis7704 -v /rdb/7704:/var/lib/redis -p 7704:6379 -d redis/cluster:v01
docker run --rm --name redis7705 -v /rdb/7705:/var/lib/redis -p 7705:6379 -d redis/cluster:v01

no1=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7700`
no2=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7701`
no3=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7702`
no4=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7703`
no5=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7704`
no6=`docker inspect --format='{{.NetworkSettings.IPAddress}}' redis7705`


echo "初始化集群"
docker exec -it redis7700 redis-cli  --cluster create  $no1:6379 $no2:6379 $no3:6379 $no4:6379 $no5:6379 $no6:6379 --cluster-replicas 1 

#echo docker exec -it redis7000 redis-cli  --cluster create  $no1:7000 $no2:7001 $no3:7002 $no4:7003 $no5:7004 $no6:7005 --cluster-replicas 1
echo `date`
echo "##########################"
