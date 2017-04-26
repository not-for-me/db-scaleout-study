FROM bitnami/mariadb:latest
MAINTAINER woojin.joe

RUN apt-get update && apt-get upgrade
RUN apt-get -y install apt-utils openssh-server openssh-client wget libdbd-mysql-perl

RUN ssh-keygen -f ~/id.rsa -t rsa -N ''

RUN wget https://downloads.mariadb.com/MHA/mha4mysql-node_0.53_all.deb
RUN dpkg -i mha4mysql-node_0.53_all.deb