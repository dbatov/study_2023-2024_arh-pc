%include 'in_out.asm'

SECTION .data
msg: DB 'Введите число: ',0
ans: DB 'Ответ: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
mov eax,msg
call sprintLF

mov ecx,x
mov edx,80
call sread

mov eax,x
call atoi
mov ebx,8
mul ebx
add eax,6
mov ebx,10
mul ebx
mov ecx,eax

mov eax,ans
call sprint
mov eax,ecx
call iprintLF

call quit