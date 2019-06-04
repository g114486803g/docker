FROM alpine/jdk8:v01

WORKDIR /usr/local/tomcat85
RUN mkdir /data/service -p
ADD tomcat85.tar.gz /usr/local/

ENTRYPOINT ["./bin/catalina.sh","run"]
