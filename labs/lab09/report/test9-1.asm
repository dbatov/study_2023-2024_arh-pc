%include 'in_out.asm'
section .data
fun db 'Функция: f(x)=12x-7',0
msg db 'Результат: ',0
section .text
global _start
_start:
pop ecx
pop edx
sub ecx,1
mov esi,0
next:
cmp ecx,0h
jz _end
pop eax
call atoi
call _calc
add esi,eax
loop next
_end:
mov eax,fun
call sprintLF
mov eax,msg
call sprint
mov eax,esi
call iprintLF
call quit

_calc:
mov ebx,12
mul ebx
sub eax,7
ret