- Change default password
```
sudo -i -u postgres psql
> ALTER ROLE postgres WITH PASSWORD <password>
```

- add user
```
CREATE USER <user> WITH PASSWORD <password>;
ALTER ROLE <user> SET client_encoding TO 'utf8';
ALTER ROLE <user> SET default_transaction_isolation TO 'read committed';
ALTER ROLE <user> SET timezone TO 'UTC';
```
- Create database
```
CREATE DATABASE <database>;
GRANT ALL PRIVILEGES ON DATABASE <database> TO <user>;
```
