global  _ft_strcpy

section .text

_ft_strcpy:

    mov     rax, 0
    mov     rcx, 0

.copy:
    cmp     byte[rsi + rcx], 0      ; boolean condition if end of str 
    je      .out
    mov     dl, byte[rsi + rcx] 
    mov     byte[rdi + rcx], dl
    inc     rcx
    jmp     .copy

.out:
    mov     dl, byte[rsi + rcx]
    mov     byte[rdi + rcx], dl
    mov     rax, rdi
    ret