%include 'in_out.asm'

SECTION .data
prim DB "f(x)=15x-9",0
msg db "Результат: ",0

SECTION .text
global _start

_start:
pop ecx 

pop edx 

sub ecx,1 

mov esi,0

mov eax,prim
call sprintLF
next:
cmp ecx, 0
jz _end 

pop eax
call atoi
call fir
add esi,eax

loop next 

_end:
mov eax,msg
call sprint
mov eax,esi
call iprintLF
call quit

fir:
mov ebx,15
mul ebx
sub eax,9
ret