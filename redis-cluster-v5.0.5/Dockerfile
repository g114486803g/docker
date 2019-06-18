FROM alpine:v02

RUN apk add redis

ENV REDIS_C=/etc
RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf \
    && sed -i 's/daemonize yes/daemonize no/g'           /etc/redis.conf \
    &&   sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g'          /etc/redis.conf
RUN echo "cluster-enabled yes" >> $REDIS_C/redis.conf
RUN echo "cluster-config-file nodes.conf" >> $REDIS_C/redis.conf
RUN echo "cluster-node-timeout 5000" >> $REDIS_C/redis.conf
RUN echo "appendonly yes" >> $REDIS_C/redis.conf
CMD [ "redis-server", "/etc/redis.conf" ]
