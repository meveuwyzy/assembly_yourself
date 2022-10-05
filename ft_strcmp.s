global _ft_strcmp   
;(rdi, rsi)

section .text

_ft_strcmp:

    mov     rax, 0
    mov     r10,  0      ; free to use register
    mov     rcx, 0      ; increment

.compare:
    mov     al, byte [rdi + rcx]
    mov     r10b, byte [rsi + rcx]

    test    al, al         ; end of str 
    jz      .out

    cmp     al, r10b        ; if this bytes of registers not equal
    jne     .out

    inc     rcx
    jmp     .compare

.out:
    sub     rax, r10
    ret