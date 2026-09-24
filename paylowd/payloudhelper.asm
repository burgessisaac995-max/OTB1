.intel_syntax noprefix

.global _start

.section .text
_start:
	mov rax, [rsp]
	lea rsi, [rsp + 8]
	lea rdx, [rsi + rax * 8 + 8]
	lea rdi, [rip + payloud_path]
	mov rax, 59
	syscall

	mov rax, 60
	mov rdi, 127
	syscall

.section .rodata
payloud_path:
	.asciz "./payloud.bin"
