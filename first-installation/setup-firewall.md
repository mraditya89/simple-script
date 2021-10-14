1. Firewall status : 
- `sudo ufw status`
- `sudo ufw status numbered`
2. Enable Firewall : `sudo ufw enable`
3. Open service / port : 
- `sudo ufw allow ssh`
- `sudo ufw allow <port>/tcp` 
- `sudo ufw allow <port>/udp`
4. Close port : 
- `sudo ufw deny <port>/tcp`
- Close service by numbered
  - `sudo ufw status numbered` 
  - `sudo ufw delete [service number]`
