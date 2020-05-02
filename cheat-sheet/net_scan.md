# Network Scan

```bash
sudo nmap -sS -sV -P0 -e eth0 --source-port 53 --data-length 3 -p1-65535 -T Aggressive -min_parallelism 3 -iL hosts.txt --script "default,safe,external" -oX scan.result.xml
```


