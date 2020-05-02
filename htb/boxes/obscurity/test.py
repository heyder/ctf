import os
import sys
import urllib.parse

print(sys.argv[1])
# exec('__import__("os").popen(r"touch /tmp/aa").read()')
path = urllib.parse.unquote(sys.argv[1])

info = "output = 'Document: {}'" # Keep the output for later debug
print(info.format(path)) # This is how you do string formatting, right?
exec(info.format(path)) # This is how you do string formatting, right?
