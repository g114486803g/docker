一. 获取一个docker基础镜像
docker pull registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:alpine-v02

二.改名
docker tag registry.cn-shenzhen.aliyuncs.com/jbjb/alpine:alpine-v02 alpine:v02 

三 .-----------编译docker容器------------
docker build -t redis/alpine:v5.0.5 .

--------------------------------

1.启动一个master节点 并做持久化（/var/lib/redis是容器目录）
docker run --rm -itd -v /db/redis:/var/lib/redis --name master-redis -p6379:6379 redis/alpine:v5.0.5 master

2.启动一个slave节点 并做持久化 （/var/lib/redis是容器目录）
docker run --rm  -itd -v /db/7001:/var/lib/redis --name node1 --link master-redis:master-redis -p7001:6379 redis/alpine:v5.0.5 slave


3.登录从节点

[root@DOBI2 ~]# /usr/local/redis/bin/redis-cli -h 172.16.8.244 -p 7001
172.16.8.244:7001> KEYS *
(empty list or set)

4.做主节点的slave。
172.16.8.244:7001> SLAVEOF 172.17.0.2 6379
OK
172.16.8.244:7001> KEYS *
1) "jjjj"

5.查看已经加入到主节点
172.16.8.244:7001> INFO Replication
# Replication
role:slave
master_host:172.17.0.2
master_port:6379
master_link_status:up
master_last_io_seconds_ago:0
master_sync_in_progress:0
slave_repl_offset:2044
slave_priority:100
slave_read_only:1

----------------------------
密码也可以这样设置
启动并设置密码、开启持久化

docker run --rm -itd -v /db/redis:/var/lib/redis --name master-redis -p6379:6379 --requirepass "mypassword" --appendonly yes redis/alpine:v5.0.5 master

==========================
可以选择一建部署
 wget https://github.com/g114486803g/docker/raw/master/Redis/all-redis.sh -P /tmp && sh /tmp/all-redis.sh


