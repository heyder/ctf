# Buffer over flow

gdb tricks
```
define hook-stop
    x/1i $eip
    x/8wx $esp
end
```

## Methodology
### Fuzzing to crash
### Overwrite EIP
### Figure out exactly how many bytes (find offset)
### Find bad chars

```
!mona byarray
```
```
!mona compare -f c:\logs\slmail\bytearray.bin -a 0x01cea154 (address contained on ESP)
```

### find jmp esp
```
!mona find -s "\xff\xe4" -m EXECUTABLE
```