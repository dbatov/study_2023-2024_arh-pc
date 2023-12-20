%include 'in_out.asm'
section .data
msgx db 'Введите х: ',0h
msga db 'Введите а: ',0h
msgres db 'Результат вычислений: ',0h
section .bss
x resb 10
a resb 10
res resb 10
section .text
global _start
_start:
mov eax,msgx
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
call atoi
mov [x],eax
mov eax,msga
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a
call atoi
mov [a],eax
mov ecx,[a]
cmp ecx,7
jge subt
mov eax,[a]
mov ecx,[x]
mul ecx
mov [res],eax
jmp _fin
subt:
mov eax,[a]
sub eax,7
mov [res],eax
_fin:
mov eax,msgres
call sprint
mov eax,[res]
call iprintLF
call quit