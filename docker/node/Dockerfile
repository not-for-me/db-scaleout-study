FROM bitnami/mariadb:latest
MAINTAINER woojin.joe

RUN apt-get update && apt-get -y --force-yes upgrade
RUN apt-get -y --force-yes install apt-utils ssh sshpass libdbd-mysql-perl

RUN sed -n -i 's/UsePAM yes/UsePAM no/gp' /etc/ssh/sshd_config

COPY ./resources/*deb /pkg/
COPY ./resources/*.sh /root/scripts/

RUN dpkg -i /pkg/mha4mysql-node_0.53_all.deb
