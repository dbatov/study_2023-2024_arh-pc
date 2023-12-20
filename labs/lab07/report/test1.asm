%include 'in_out.asm'
section .data
msg db 'Наименьшее число: ',0h
A dd '84'
B dd '32'
C dd '77'
section .bss
min resb 10
section .text
global _start
_start:
mov eax,A
call atoi
mov [A],eax
mov eax,B
call atoi
mov [B],eax
mov eax,C
call atoi
mov [C],eax
mov ecx,[A]
mov [min],ecx
cmp ecx,[C]
jl check_B
mov ecx,[C]
mov [min],ecx
check_B:
mov ecx,[min]
cmp ecx,[B]
jl fin
mov ecx,[B]
mov [min],ecx
fin:
mov eax,msg
call sprint
mov eax,[min]
call iprintLF
call quit