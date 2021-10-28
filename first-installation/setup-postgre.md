- Change default password
```
sudo -i -u postgres psql
> ALTER ROLE postgres WITH PASSWORD <password>
```

- add user
```
# Create User
CREATE USER <user> WITH PASSWORD '<password>';
ALTER ROLE <user> SET client_encoding TO 'utf8';
ALTER ROLE <user> SET default_transaction_isolation TO 'read committed';
ALTER ROLE <user> SET timezone TO 'UTC';

# Change User Password
ALTER USER <user> WITH PASSWORD '<password>';
```

- Basic Function
```
# database list
\l
# exit
\q
```

- Create / Delete Database 
```
# Create
CREATE DATABASE <database>;
GRANT ALL PRIVILEGES ON DATABASE <database> TO <user>;
# Delete
DROP DATABASE <database>;
```

- Migrate database
```
# Dump a database
pg_dump --dbname=postgresql://xreaderuser:strongPassword@127.0.0.1:5432/xreaderdb > xreaderdb.sql
# Restore a database
psql -U postgres xreaderdb < xreaderdb.sql
```

- Secure Postgre : Set access with password: change peer into md5
```
# pg_hba.conf
# Database administrative login by Unix domain socket
local   all             postgres                                md5

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
host    all             all             192.168.3.168/24        md5
host    all             all             0.0.0.0/0               md5
# IPv6 local connections:
host    all             all             ::1/128                 md5

```
- Change listen address into listen_addresses = '*' in postgresql.conf
- Restart process : `sudo systemctl restart postgresql`
