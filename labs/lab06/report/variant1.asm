;--------------------------------
; Программа вычисления варианта
;--------------------------------

%include 'in_out.asm'

  SECTION .data
  abc: DB 'Выражение для вычисления: y = (8x-6)/2',0
  msg: DB 'Введите значение переменной x: ',0
  rem: DB 'Результат: ',0

  SECTION .bss
  x: RESB 80

  SECTION .text
  GLOBAL _start
   _start:

   mov eax, abc
   call sprintLF
   
   mov eax, msg
   call sprintLF

   mov ecx, x
   mov edx, 80
   call sread

   mov ebx,8
   mov eax,x ; вызов подпрограммы преобразования
   call atoi ; ASCII кода в число, `eax=x`
   mul ebx
   add eax,-6
   xor edx,edx
   mov ebx,2
   div ebx
   mov edi,eax

   mov eax,rem
   call sprintLF
   mov eax,edi
   call iprintLF
   
   call quit