FROM debian:latest 
MAINTAINER woojin.joe

# VOLUME ["/bitnami/mariadb"]

RUN apt-get update && apt-get upgrade
RUN apt-get -y install apt-utils ssh wget libdbd-mysql-perl libconfig-tiny-perl liblog-dispatch-perl libparallel-forkmanager-perl
RUN ssh-keygen -f ~/.ssh/id.rsa -t rsa -N ''
EXPOSE 22
RUN /etc/init.d/ssh start
RUN echo 'root:1234' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


RUN wget https://downloads.mariadb.com/MHA/mha4mysql-node_0.53_all.deb
RUN dpkg -i mha4mysql-node_0.53_all.deb
RUN wget https://downloads.mariadb.com/MHA/mha4mysql-manager_0.53_all.deb
RUN dpkg -i mha4mysql-manager_0.53_all.deb
RUN mkdir -p /var/log/masterha/app1
COPY *.cnf /etc/
COPY *.sh /

CMD ["/usr/sbin/sshd", "-D"]
RUN sed -i 's/PermitRootLogin with-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ENTRYPOINT ["/docker-entrypoint.sh"]
