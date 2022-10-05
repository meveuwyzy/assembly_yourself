global _ft_strlen

section .text

_ft_strlen:
    mov     rax, 0
    .cycle:
        cmp     byte [rdi + rax], 0     ; syntax condition to comparison 
        je      .out                    ; "jump" if "equal" to point .out
        inc     rax
        jmp     .cycle
    .out:
        ret