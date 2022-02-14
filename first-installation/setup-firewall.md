1. Firewall status : 
- `sudo ufw status`
- To see added rule before enabling : `sudo ufw show added` 
- To see added rule after enabling : `sudo ufw status numbered`
2. Open service / port : 
- `sudo ufw allow ssh`
- `sudo ufw allow <port>/tcp` 
- `sudo ufw allow <port>/udp`
3. Enable Firewall : `sudo ufw enable`.
Note : make sure allow ssh before enable it
5. Close port : 
- `sudo ufw deny <port>/tcp`
- Close service by numbered
  - `sudo ufw status numbered` 
  - `sudo ufw delete [service number]`
