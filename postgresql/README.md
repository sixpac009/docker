Docker-PostgreSQL
==========

Deploy Postgresql Server on Docker,You can build postgresql docker with this dockerfile  

## create a folder for postgresql data  
```
sudo mkdir ~/pgdata  
```
## run docker backend  
```
docker run -d -p 5432:5432 -v ~/pgdata:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=<Your username> -e POSTGRESQL_PASS=<Your password> -e POSTGRESQL_DB=<Database name> &   
e.g:  
sudo docker run -d -p 5432:5432 -v ~/pgdata:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=demo -e POSTGRESQL_PASS=demo -e POSTGRESQL_DB=demo 'cloudcube/postgresql' &  
```
## how to use?  
```
sudo rpm -Uvh http://yum.postgresql.org/9.3/fedora/fedora-20-x86_64/pgdg-fedora93-9.3-1.noarch.rpm  
sudo yum install postgresql93  
psql -h localhost -p 5432 -U demo -W demo  
```
## note    
-v 指定container卷存储，container的路径要和run脚本中的`POSTGRESQL_DATA`一致.  
postgresql openssl未配置成功.  


