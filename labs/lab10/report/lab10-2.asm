%include 'in_out.asm'

SECTION .data
file db 'name.txt', 0h 
msg db 'Как Вас зовут? ', 0h
imia DB 'Меня зовут ', 0h 

SECTION .bss
con resb 2550 ; переменная для вводимой строки

SECTION .text
global _start
_start:

; --- Печать сообщения `msg`
mov eax,msg
call sprintLF

; ---- Запись введеной с клавиатуры строки в `contents`
mov ecx, con
mov edx, 2550
call sread

; --- Открытие существующего файла (`sys_open`)
mov ecx, 0777o ; открываем для записи (2)
mov ebx, file
mov eax, 8
int 80h

; --- Запись дескриптора файла в `esi`
mov esi, eax

; --- Расчет длины введенной строки
mov eax, imia ; в `eax` запишется количество
call slen ; введенных байтов

; --- Записываем в файл `contents` (`sys_write`)
mov edx, eax
mov ecx, imia
mov ebx, esi
mov eax, 4
int 80h

mov eax, con
call slen

mov edx, eax
mov ecx, con
mov ebx, esi
mov eax, 4
int 80h

; --- Закрываем файл (`sys_close`)
mov ebx, esi
mov eax, 6
int 80h
call quit