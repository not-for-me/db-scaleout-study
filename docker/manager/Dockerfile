FROM debian:latest
MAINTAINER woojin.joe

# VOLUME ["/bitnami/mariadb"]

RUN apt-get update && apt-get upgrade
RUN apt-get -y install apt-utils openssh-server openssh-client wget libdbd-mysql-perl libconfig-tiny-perl liblog-dispatch-perl libparallel-forkmanager-perl
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''

RUN wget https://downloads.mariadb.com/MHA/mha4mysql-node_0.53_all.deb
RUN dpkg -i mha4mysql-node_0.53_all.deb
RUN wget https://downloads.mariadb.com/MHA/mha4mysql-manager_0.53_all.deb
RUN dpkg -i mha4mysql-manager_0.53_all.deb
RUN mkdir -p /var/log/masterha/app1
COPY *.cnf /etc/
COPY *.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
