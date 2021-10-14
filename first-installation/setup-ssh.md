1. create ssh keys on client side : `ssh-keygen`
2. copy public key to server
- `ssh-copy-id username@remote_host`
- or copy manually your key `~/.ssh/id_rsa.pub`, then add it into `~/.ssh/authorized_keys` file
```
...
ssh-rsa <public key>
```
3. Authenticating to your server
- `ssh username@remote_host`
4. Disabling password authentication
- `sudo nano /etc/ssh/sshd_config`
```
...
PasswordAuthentication no
...
```
- Restart sshd service : `sudo systemctl restart ssh`
