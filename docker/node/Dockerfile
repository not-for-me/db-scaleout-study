FROM bitnami/mariadb:latest
MAINTAINER woojin.joe

RUN apt-get update && apt-get upgrade
RUN apt-get -y install apt-utils ssh wget libdbd-mysql-perl
RUN ssh-keygen -f ~/.ssh/id.rsa -t rsa -N ''
EXPOSE 22
RUN /etc/init.d/ssh start
RUN echo 'root:1234' | chpasswd
RUN wget https://downloads.mariadb.com/MHA/mha4mysql-node_0.53_all.deb
RUN dpkg -i mha4mysql-node_0.53_all.deb
RUN sed -i 's/PermitRootLogin with-password/PermitRootLogin yes/' /etc/ssh/sshd_config
CMD ["/usr/sbin/sshd", "-D"]