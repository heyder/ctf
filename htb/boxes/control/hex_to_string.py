#!/usr/bin/env python3
import sys
import codecs
filename = sys.argv[1]
with open(filename, 'rb') as f:
    content = f.read()
page = codecs.decode(content.strip(),'hex')
print(page.decode('utf-8'))
