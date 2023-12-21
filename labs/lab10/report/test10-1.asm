%include 'in_out.asm'
filename db 'name.txt',0h
msg db 'Как Вас зовут? ',0h
strin db 'Меня зовут ',0h
section .bss
contents resb 255
section .text
global _start
_start:
mov eax,msg
call sprint
mov ecx,contents
mov edx,255
call sread
mov ecx,777
mov ebx,filename
mov eax,8
int 80h
mov esi,eax
mov eax,strin
call slen
mov edx,eax
mov ecx,strin
mov ebx,esi
mov eax,4
int 80h
mov eax,contents
call slen
mov edx,eax
mov ecx,contents
mov ebx,esi
mov eax,4
int 80h
mov ebx,esi
mov eax,6
int 80h
call quit