
extern ___error

global _ft_write

section .text

_ft_write:
	mov rax, 0x2000004		; set rax to call write
    syscall					; (rdi, rsi, rdx) = (fd, buf, len)
	jc		.iferr          ; some boolean condition
	ret

.iferr:
		mov		r9, rax				 ; r9 is "tmp" or some bufffer  
		push	-1;					 ; stack initialisation
		call ___error				 ; write by rax using the adress global errno
		mov		[rax], r9			 ; writing to erno(global var) code of error
		pop		rax					 ; close stack and write (-1) to rax
		ret