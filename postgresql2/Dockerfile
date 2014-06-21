FROM fedora
MAINTAINER sixpac009

RUN yum -y update; yum clean all
RUN yum -y install postgresql-server postgresql postgresql-pltcl postgresql-contrib supervisor ; yum clean all

ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./postgres_user.sh /postgres_user.sh
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_postgres.sh /start_postgres.sh

RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /start_postgres.sh
RUN chmod +x /postgres_user.sh

RUN /usr/bin/postgresql-setup initdb

ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf;
#RUN echo "local    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf;                                                                                                                                                         
#RUN echo "local 	spaceschema 	spaceuser 							md5" >> /var/lib/pgsql/data/pg_hba.conf; \
#echo "host  	spaceschema 	spaceuser 		127.0.0.1/8			md5" >> /var/lib/pgsql/data/pg_hba.conf; \
#echo "host  	spaceschema 	spaceuser 			::1/128			md5" >> /var/lib/pgsql/data/pg_hba.conf; \
#echo "local 	spaceschema 	postgres  						  ident" >> /var/lib/pgsql/data/pg_hba.conf;



RUN /postgres_user.sh

EXPOSE 5432

CMD ["/bin/bash", "/start_postgres.sh"]
