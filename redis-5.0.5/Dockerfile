FROM alpine:latest

MAINTAINER jbjb@jbjb.com


RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache curl bash tree tzdata && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


#RUN apk --no-cache add ca-certificates wget
#RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
#RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk
#RUN apk add glibc-2.29-r0.apk 
RUN addgroup -S redis && adduser -S -G redis redis


ENV TIMEZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 修改一些系统设置
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
RUN echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local

# 开始安装 redis
#RUN apk add redis 5.0.5-r0
#COPY start_redis.sh /usr/local/
#RUN chmod +x /usr/local/start_redis.sh
#RUN chown redis:redis /usr/local/start_redis.sh

ADD redis-5.0.5.tar.gz /tmp

RUN set -x \
&&  apk add --no-cache --virtual .build-deps  gcc linux-headers make musl-dev  tar


RUN  cd /tmp/redis-5.0.5 && make PREFIX=/usr/local/redis install  && rm -rf redis-5.0.5 \  
   &&  apk del .build-deps 

COPY redis.conf /usr/local/redis
COPY  start_redis.sh /usr/local/redis
RUN chmod +x /usr/local/redis/start_redis.sh
RUN chown redis:redis /usr/local/redis/start_redis.sh
RUN mkdir /data/db -p
RUN ln -s /usr/local/redis/bin/redis-server /usr/bin/redis-server
WORKDIR  /usr/local/redis

CMD ["redis-server","/usr/local/redis/redis.conf"]
#ENTRYPOINT ["redis-server ./redis.conf"]
#CMD ["redis-server ./redis.conf"]
#ENV APP_FILE /usr/local/redis/start_redis.sh
#CMD $APP_FILE
#ENTRYPOINT ["start_redis.sh"]
#CMD ["/bin/bash","start_redis.sh"]
#CMD ["start_redis.sh","g","daemon off;"]

#CMD ["sh", "-c","/start_redis.sh"]

#ENTRYPOINT exec  redis-server /usr/local/redis/redis.conf
