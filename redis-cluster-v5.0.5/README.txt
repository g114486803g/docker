
一键安装脚本
wget https://github.com/g114486803g/docker/raw/master/redis-cluster-v5.0.5/cluster.sh && sh cluster.sh


删除所有运行中的容器
 docker kill $(docker ps -a -q)
 
 删除redis镜像
 docker rmi redis/cluster:v01 

删除持久化目录
rm -rf /rdb/


初始化集群
>>> Performing hash slots allocation on 6 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 172.17.0.6:6379 to 172.17.0.2:6379
Adding replica 172.17.0.7:6379 to 172.17.0.3:6379
Adding replica 172.17.0.5:6379 to 172.17.0.4:6379
M: bfc39907fa45fa927ea2bc23c1819302344f5e4d 172.17.0.2:6379
   slots:[0-5460] (5461 slots) master
M: 09d6f911b2be9a2b620e0f3031819287ea21b2a0 172.17.0.3:6379
   slots:[5461-10922] (5462 slots) master
M: 030aabe23122bfc43d0a26fe622a357331434774 172.17.0.4:6379
   slots:[10923-16383] (5461 slots) master
S: 2a24c480e27dc7208384193b8f0e456d95968a35 172.17.0.5:6379
   replicates 030aabe23122bfc43d0a26fe622a357331434774
S: 9d4a65012779dbf7e6000478b7aaa0e82e447eb1 172.17.0.6:6379
   replicates bfc39907fa45fa927ea2bc23c1819302344f5e4d
S: 1b64d6dd945ffb93a68d9c1fd6a9127d7dd62a1d 172.17.0.7:6379
   replicates 09d6f911b2be9a2b620e0f3031819287ea21b2a0
Can I set the above configuration? (type 'yes' to accept): yes  <<<<<--------(温馨提示) 请在这部输入yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
...
>>> Performing Cluster Check (using node 172.17.0.2:6379)
M: bfc39907fa45fa927ea2bc23c1819302344f5e4d 172.17.0.2:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
S: 9d4a65012779dbf7e6000478b7aaa0e82e447eb1 172.17.0.6:6379
   slots: (0 slots) slave
   replicates bfc39907fa45fa927ea2bc23c1819302344f5e4d
S: 2a24c480e27dc7208384193b8f0e456d95968a35 172.17.0.5:6379
   slots: (0 slots) slave
   replicates 030aabe23122bfc43d0a26fe622a357331434774
M: 030aabe23122bfc43d0a26fe622a357331434774 172.17.0.4:6379
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
S: 1b64d6dd945ffb93a68d9c1fd6a9127d7dd62a1d 172.17.0.7:6379
   slots: (0 slots) slave
   replicates 09d6f911b2be9a2b620e0f3031819287ea21b2a0
M: 09d6f911b2be9a2b620e0f3031819287ea21b2a0 172.17.0.3:6379
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
2019年 06月 18日 星期二 17:42:58 CST
##########################
