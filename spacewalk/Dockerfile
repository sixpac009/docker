# spacewalk
#
# VERSION               0.0.1

FROM     fedora:20
MAINTAINER sixpac009

# configure the hostname 
#RUN echo "NAME=docker.spacewalk.example.org" > /etc/sysconfig/network; hostname "docker.spacewalk.example.org"

# make sure the package repository is up to date
RUN yum update -y

RUN yum install -y http://yum.spacewalkproject.org/2.1/Fedora/20/x86_64/spacewalk-repo-2.1-2.fc20.noarch.rpm

RUN cat > /etc/yum.repos.d/jpackage-generic.repo << EOF
[jpackage-generic]
name=JPackage generic
#baseurl=http://mirrors.dotsrc.org/pub/jpackage/5.0/generic/free/
mirrorlist=http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0
enabled=1
gpgcheck=1
gpgkey=http://www.jpackage.org/jpackage.asc
EOF
#(for postgrsql embedded install) comment out if not installing db localy
RUN yum install -y spacewalk-setup-postgresql
RUN yum install -y rpm-build rpm-python
RUN yum downgrade -y rpm{,-build-libs,-devel,-libs,-python,-build,-apidocs,-cron,-sign,-python3}-4.11.1-7.fc20
RUN yum install -y spacewalk-postgresql

# configure the firewall
RUN firewall-cmd --add-service=http
RUN firewall-cmd --add-service=https
EXPOSE 443
# CMD    ["/usr/sbin/sshd", "-D"]
