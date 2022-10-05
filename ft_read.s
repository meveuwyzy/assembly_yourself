extern ___error

global _ft_read      ; same as ft_write

section .text

_ft_read:
	mov rax, 0x2000003		; only difference
    syscall		
	jc		.iferr        
	ret

.iferr:
		mov		r9, rax         
		push	-1;				
		call ___error			
		mov		[rax], r9	
		pop		rax			
		ret