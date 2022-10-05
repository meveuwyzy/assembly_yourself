global  _ft_strdup ; (char *s = rdi)

extern  _ft_strlen
extern  _malloc
extern  _ft_strcpy

section .text

_ft_strdup:
    call    _ft_strlen
    inc     rax             ; "\0"
    push    rdi
    mov     rdi, rax        
    call    _malloc
    cmp     rax, 0
    je      .iferr
    mov     rdi, rax
    pop     rsi             ; free stack
    call    _ft_strcpy
    ret

.iferr:
    pop     rdi         ; close stack
    mov     rax, 0      ; code of error
    ret