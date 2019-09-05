FROM alpine/jdk8:v01
MAINTAINER JBJB@USABC.com

WORKDIR  /java/service

ADD dog-0.0.1-SNAPSHOT.jar  /java/service



EXPOSE 8080
ENTRYPOINT java -Xms512m -Xmx512m -Xss256k -XX:PermSize=64m -XX:MaxPermSize=500m -jar dog-0.0.1-SNAPSHOT.jar 
