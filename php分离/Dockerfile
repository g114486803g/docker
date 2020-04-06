FROM alpine:latest
MAINTAINER jbjb@jb.com

# 修正时区
ENV TIMEZONE Asia/Shanghai

RUN echo http://mirrors.aliyun.com/alpine/v3.11/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.11/community/ >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add tzdata bash-doc bash && \
    apk add php7 php7-dev php7-fpm && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    echo $TIMEZONE > /etc/timezone
 

EXPOSE 9000

CMD  ["php-fpm7","-F"]
## 注意这里一定要加 -F 参数，放到前台执行
