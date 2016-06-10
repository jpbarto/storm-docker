FROM java:7-jdk-alpine

MAINTAINER jpbarto

RUN mkdir /opt
RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-0.9.4
RUN addgroup storm; adduser -G storm -h /home/storm -s /bin/bash -D storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN apk update && apk add -u python py-pip
RUN pip install supervisor
RUN mkdir -p /etc/supervisor/conf.d && touch /etc/supervisor/supervisord.conf
RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
