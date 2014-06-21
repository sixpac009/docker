FROM fedora/systemd-systemd
MAINTAINER sixpac009

RUN yum install -y postgresql-server postgresql-pltcl;
RUN systemctl enable postgresql.service;

RUN sed -i -e "s/^Defaults\s*requiretty/#Defaults  requiretty/g" /etc/sudoers

ADD runspacewalk /usr/local/bin/runspacewalk
RUN chmod +x /usr/local/bin/runspacewalk

EXPOSE 5432
CMD ["/usr/sbin/init"]

##USER postgres

##CMD ["/usr/local/bin/runspacewalk"]
#postgresql-setup initdb; \
#systemctl start postgresql.service
