# Web fuzzing

```bash
nikto.pl -h 172.16.188.129 -evasion 28 -Tuning x6 -mutate 12345
```

```bash
wfuzz.py -c -z file -f wordlist/general/common.txt,wordlist/general/extensions_common.txt --hc 404 -R 3 http://127.0.01/FUZZFUZ2Z
```

```
gobuster dir -u https://mysite.com/path/to/folder -c 'session=123456' -t 50 -w common-files.txt -x .php,.html
```
