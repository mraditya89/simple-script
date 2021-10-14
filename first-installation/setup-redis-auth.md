1. Test redis communication :
```
redis-cli
> ping
  Output : PONG
> set mykey "hey it works"
> get mykey
  Output : hey it works 
```
2. Create Authentication
- generate password : `openssl rand 60 | openssl base64 -A`
- Edit configuration file : `sudo nano /etc/redis/redis.conf`
```
requirepass <password>
```
- restart service : `sudo systemctl restart redis`
- check service : `sudo systemctl status redis`

3. Test Auth
- Without auth : 
```
redis-cli
> ping 
```
- With auth : redis-cli -a <password>
> ping 
  Output : PONG
> get mykey
  Output : hey it works
