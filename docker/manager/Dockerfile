FROM debian:latest 
MAINTAINER woojin.joe

RUN apt-get update && apt-get -y --force-yes upgrade
RUN apt-get -y --force-yes install apt-utils ssh sshpass libdbd-mysql-perl libconfig-tiny-perl liblog-dispatch-perl libparallel-forkmanager-perl

RUN sed -n -i 's/UsePAM yes/UsePAM no/gp' /etc/ssh/sshd_config

COPY ./resources/*deb /pkg/
COPY ./resources/*.cnf /etc/
COPY ./resources/*.sh /root/scripts/


RUN dpkg -i /pkg/mha4mysql-node_0.53_all.deb
RUN dpkg -i /pkg/mha4mysql-manager_0.53_all.deb
RUN mkdir -p /var/log/masterha/app1