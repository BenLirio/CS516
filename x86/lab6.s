
.global _start
.extern printf

_start:

movq i, %r8
movq g, %r9

cmp $4, %r9
jne Else
movq $1, %r10
addq %r9, %r10
jmp Done
Else:
movq $-2, %r10
addq %r9, %r10
Done:


movq $60, %rax
movq $0, %rdi
syscall
.data
  i: .quad 4
  g: .quad 1
  format: .asciz "hello world\n"
