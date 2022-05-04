
	.section .text
	.globl _start

_start:

	xorl	%eax,%eax
	pushq	%rax
	movl	$0x646c726f,(%rsp)
	movw	$0xa21,0x4(%rsp)
	movq	$0x57202c6f6c6c6548,%rax
	pushq	%rax
	pushq	$0x1
	popq	%rax
	pushq	$0x1
	popq	%rdi
	movq	%rsp,%rsi
	pushq	$0xe
	popq	%rdx
	syscall
	xorl	%edi,%edi
	pushq	$0x3c
	popq	%rax
	syscall

