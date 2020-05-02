from passlib.hash import pbkdf2_sha512

p = open('/usr/share/seclists/Passwords/Most-Popular-Letter-Passes.txt','r')
f = open('hashs', 'r')

for p_line in p.readlines():
    for h_line in f.readlines():
        print(h_line)
        pbkdf2_sha512.verify(p_line, h_line)
