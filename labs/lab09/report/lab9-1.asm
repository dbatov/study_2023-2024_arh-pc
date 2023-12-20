%include 'in_out.asm'
section .data
msg db 'Введите х: ',0
result db 'f(g(x))=',0
section .bss
x resb 80
res resb 80
subres resb 80
section .text
global _start
_start:
mov eax,msg
call sprint
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
call _calcul
mov eax,result
call sprint
mov eax,[res]
call iprintLF
call quit

_calcul:
call _subcalcul
mov eax,[subres]
mov ebx,2
mul ebx
add eax,7
mov [res],eax
ret

_subcalcul:
mov ebx,3
mul ebx
sub eax,1
mov [subres],eax
ret