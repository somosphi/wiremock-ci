FROM openjdk:8-jre-alpine

LABEL maintainer="henrique.schmidt@somosphi.com"

ENV WIREMOCK_VERSION 2.24.1

RUN apk add --update openssl && \
  apk add --no-cache 'su-exec>=0.2' bash  && \
  mkdir -p /var/wiremock/lib/ && \
  wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar \
    -O /home/wiremock-jre8-standalone.jar

WORKDIR /home/wiremock

COPY ./src /home/wiremock

VOLUME /home/wiremock

EXPOSE 8080 8443

CMD java -jar /home/wiremock-jre8-standalone.jar --root-dir="/home/wiremock"
