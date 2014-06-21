#!/bin/bash
source postgres_user.sh
source stat_postgres.sh

POSTGRESQL_DATA="/var/lib/pgsql/data"

__init_db(){
	/usr/bin/postgresql-setup initdb
}

__postgres_conf(){
	rsync -avP /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.bak
	rsync -avp /postgresql.conf /var/lib/pgsql/data/.
	echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf
#	echo "local 	spaceschema 	spaceuser 							md5" >> /var/lib/pgsql/data/pg_hba.conf;
#   echo "host  	spaceschema 	spaceuser 		127.0.0.1/8			md5" >> /var/lib/pgsql/data/pg_hba.conf;
#	echo "host  	spaceschema 	spaceuser 			::1/128			md5" >> /var/lib/pgsql/data/pg_hba.conf;
#	echo "local 	spaceschema 	postgres  						  ident" >> /var/lib/pgsql/data/pg_hba.conf;
}

# Call functions
#if [ ! -d $POSTGRESQL_DATA ]; then
#	mkdir -p $POSTGRESQL_DATA
#    chown -R postgres:postgres $POSTGRESQL_DATA
#	__init_db
#	__postgres_conf
#fi
#__init_db
#__postgres_conf
__mod_user
__create_db
__run_supervisor