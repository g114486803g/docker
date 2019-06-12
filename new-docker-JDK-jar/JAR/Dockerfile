FROM nsw-alpine/jdk8:v100
MAINTAINER JBJB@USABC.com

WORKDIR  /java/service

#ENV MY_FILE /java/service/dog.sh
ADD dog-0.0.1-SNAPSHOT.jar  /java/service

ADD dog.sh /java/service

RUN chmod +x /java/service/dog.sh

EXPOSE 8080
ENTRYPOINT java -Xms512m -Xmx512m -Xss256k -XX:PermSize=64m -XX:MaxPermSize=500m -jar dog-0.0.1-SNAPSHOT.jar 
