#!/bin/bash

__mod_user() {
	usermod -G wheel postgres
}

__create_db() {
	su --login postgres --command "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432" &
	sleep 10
	ps aux 

	su - postgres -c 'PGPASSWORD=spacepw; createdb -E UTF8 spaceschema ; createlang plpgsql spaceschema ; createlang pltclu spaceschema ; yes $PGPASSWORD | createuser -P -sDR spaceuser'

	#su --login - postgres --command "psql -c \"CREATE USER dockeruser with CREATEROLE superuser PASSWORD 'password';\""
	#su --login - postgres --command "psql -c \"CREATE DATABASE dockerdb;\""
	#su --login - postgres --command "psql -c \"\du;\""
}

# Call functions
__mod_user
__create_db

