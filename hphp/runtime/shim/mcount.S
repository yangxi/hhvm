	.file	"mcount.S"
	.globl	shim_ip
	.section	.tbss,"awT",@nobits
	.align 8
	.type	shim_ip, @object
	.size	shim_ip, 8
shim_ip:
	.zero	8
	.globl	shim_fp
	.align 8
	.type	shim_fp, @object
	.size	shim_fp, 8
shim_fp:
	.zero	8
	.text
	.globl	mcount
	.type	mcount, @function
mcount:
	movq	(%rsp), %r11
	movq	%r11, %fs:shim_ip@tpoff
	movq	%rbp, %fs:shim_fp@tpoff
	ret

.LFE0:
	.size	mcount, .-mcount
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
