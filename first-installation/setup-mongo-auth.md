1. Go to mongo cli : `mongo`
2. Create user on admin database
```
show dbs
use admin
// root user
db.createUser({
  user: "root", 
  pwd: passwordPrompt(), 
  roles: [ 
    {role: "userAdminAnyDatabase", db:"admin"}, 
    "readWriteAnyDatabase"
  ]
})

// specific user
db.createUser(
  {
    user: "myUser",
    pwd:  passwordPrompt(),   // or cleartext password
    roles: [ 
      { role: "readWrite", db: "test" },
      { role: "read", db: "reporting" } 
    ]
  }
)

// get user
db.getUsers();

exit
```
3. Enabling Authentication
- Edit configuration file : `sudo nano /etc/mongod.conf`
```
...

security:
  authorization: enabled

... 

net:
  port: 27017
  bindIp: 127.0.0.1,192.168.2.8

...
```
- Restart mongod service : `sudo systemctl restart mongod`
- Check mongod service : `sudo systemctl status mongod`

4. Testing authentication
- Use mongo without auth will failed
```
mongo
> show dbs
> (will show empty database)
``` 
- Use mongo with auth 
```
mongo -u <username> -p --authenticationDatabase admin
> show dbs
> output : 
  admin  0.000GB
  config 0.000GB
  local  0.000GB           
```

- Connect to a specific database
```
mongo "mongodb://myUser:test@localhost:27017/test"
> db.todos.insert({title: "do something", isDone: false})
> db.todos.find()
```
5. Allow mongo Port if firewall active
- sudo ufw allow <port>/tcp
  
6. Backup and Restore Database
```
# Backup database
mongodump -u <user> -p <password> -d <dbName> --authenticationDatabase admin
# Restore database
mongorestore <path_dump_directory> -u <user> -p <password> -d <dbName> --authenticationDatabase admin
```
