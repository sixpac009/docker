#PostgreSQL Server
#version 1.0

#use the centos base image provided by dotCloud
FROM centos:6.4

MAINTAINER sixpac009 

#make sure the package repository is up to date.
RUN yum update -y

#install wget telnet git and sudo
RUN yum install wget telnet git sudo -y

#install epel
RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && yum install epel-release-*.rpm -y

#make sure the package repository is up to date.
RUN yum update -y

#install postgresql-server postgresql-client
RUN wget http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm && yum install pgdg-redhat93-9.3-1.noarch.rpm -y
RUN yum install postgresql93-server postgresql93 postgresql93-devel -y

#/etc/ssl/private can't be accessed from within container for some reason
#(@andrewgodwin says it's something AUFS related)
#RUN mkdir /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private

#sudo config
RUN sed -i -e "s/^Defaults\s*requiretty/#Defaults  requiretty/g" /etc/sudoers

#add postgresql config file
#ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
#ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

#add start postgresql script
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

#special a volumn for data persistent
#VOLUME ["/var/lib/pgsql/9.3/"]

#specify port for postgresql service
EXPOSE 5432

#exec run shell script
CMD ["/usr/local/bin/run"]
