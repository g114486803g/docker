FROM alpine:v02

RUN apk add redis
COPY start_redis.sh /usr/local/
RUN chmod +x /usr/local/start_redis.sh
RUN chown redis:redis /usr/local/start_redis.sh

EXPOSE 6379

ENTRYPOINT ["sh","/usr/local/start_redis.sh"]
CMD ["master"]
