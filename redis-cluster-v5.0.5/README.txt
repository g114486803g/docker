
一键安装脚本
wget https://github.com/g114486803g/docker/raw/master/redis-cluster-v5.0.5/cluster.sh && sh cluster.sh


删除所有运行中的容器
 docker kill $(docker ps -a -q)
 
 删除redis镜像
 docker rmi redis/cluster:v01 

删除持久化目录
rm -rf /rdb/
