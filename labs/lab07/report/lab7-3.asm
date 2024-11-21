%include 'in_out.asm' ; подключение внешнего файла
section .data
    msg1 db 'Введите A: ',0h
    msg2 db 'Введите X: ',0h
    msg3 db "Результат: ",0h
    
section .bss
    fin resb 10
    A resb 10
    X resb 10
    
section .text
    global _start
    
_start:
; ---------- Вывод сообщения 'Введите A: '
    mov eax,msg1
    call sprint
; ---------- Ввод 'A'
    mov ecx,A
    mov edx,10
    call sread
; ---------- Преобразование 'A' из символа в число
    mov eax,A
    call atoi ; Вызов подпрограммы перевода символа в число
    mov [A],eax

; ---------- Вывод сообщения 'Введите X: '
    mov eax,msg2
    call sprint
; ---------- Ввод 'X'
    mov ecx,X
    mov edx,10
    call sread
; ---------- Преобразование 'X' из символа в число
    mov eax,X
    call atoi ; Вызов подпрограммы перевода символа в число
    mov [X],eax


    mov ecx,[X]
    cmp ecx,5
    jge func2
    mov edx,[A]
    mov ax,[X]
    mul edx
    mov [fin],ax
    jmp final
    
func2:
    mov ax,[X]
    sub ax,5
    mov [fin],ax
    jmp final

final:
    mov eax,msg3
    call sprint ; Вывод сообщения 'Результат: '
    mov eax,[fin]
    call iprintLF ; Вывод fin
    call quit ; Выход
