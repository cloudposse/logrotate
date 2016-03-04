FROM ubuntu:14.04

MAINTAINER Erik Osterman "erik@cloudposse.com"

RUN apt-get update && \
    apt-get install -y logrotate

ENV LOGROTATE_PATHS   /var/log/*.log
ENV LOGROTATE_OPTIONS monthly, rotate 12, dateext, compress, missingok, notifempty, nocreate, su root root
ENV LOGROTATE_CONFIG  /etc/logrotate.conf
ENV LOGROTATE_STATE   /var/lib/logrotate/status

ADD start /start

USER root

ENTRYPOINT ["/start"]
CMD -f -s $LOGROTATE_STATE $LOGROTATE_CONFIG


