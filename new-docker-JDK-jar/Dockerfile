From alpine:latest
MAINTAINER dajiba@jiji.om
RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories && \
    apk update && \ 
    apk add --no-cache ca-certificates && \
    apk add --no-cache tzdata  bash curl && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


#wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk
ADD glibc-2.27-r0.apk .



WORKDIR /usr/java
ADD jdk1.8.0_201.tar.gz /usr/java

ENV JAVA_HOME=/usr/java/jdk1.8.0_201
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
