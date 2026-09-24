.intel_syntax noprefix

.global _start

.section .text
_start:
	mov r12, [rsp]
	lea r13, [rsp + 8]
	sub rsp, 4096

	lea rdi, [rip + proc_exe]
	mov rsi, rsp
	mov rdx, 4095
	mov rax, 89
	syscall
	test rax, rax
	js launch_failed

	mov r14, rax
find_directory_end:
	dec r14
	cmp byte ptr [rsp + r14], '/'
	jne find_directory_end

	lea r8, [rip + payload_suffix]
	lea r9, [rsp + r14]
copy_payload_path:
	mov al, byte ptr [r8]
	mov byte ptr [r9], al
	inc r8
	inc r9
	test al, al
	jnz copy_payload_path

	mov rax, r12
	inc rax
	shl rax, 3
	lea rdx, [r13 + rax]
	lea rsi, [r13]
	mov rdi, rsp
	mov rax, 59
	syscall

	launch_failed:
	mov rax, 60
	mov rdi, 127
	syscall

.section .rodata
proc_exe:
	.asciz "/proc/self/exe"
payload_suffix:
	.asciz "/payloud.bin"
