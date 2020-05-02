#import unicodedata
#import sys
#reload(sys)
#sys.setdefaultencoding('utf-8')
import unidecode


_file = open('BOD_30079.txt','r')
_encodings = open('encodings.txt','r')

for line in _file:
    for enc in _encodings:
        try:
            decoded_line = line.decode(enc)
            print ''.join(r'\x{02:x}'.format(ord(c)) for c in decoded_line)
        except:
            continue
