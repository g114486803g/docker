#!/bin/bash

yum -y install bash-completion.noarch wget 
wget https://download.docker.com/linux/centos/docker-ce.repo -P /etc/yum.repos.d/
yum clean all 
yum install docker-ce docker-ce-cli containerd.io -y
systemctl start docker

echo "配置阿里云加速器"
tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": ["https://0k0953tv.mirror.aliyuncs.com"]
 }
 
 EOF

systemctl daemon-reload
systemctl restart docker.service 
