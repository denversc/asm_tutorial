.syntax unified
.arch armv7-a
.text
.align  2
.global _start

_start:
    mov r0, 5  @ exit code of 5
    mov r7, 1  @ syscall of exit is 1
    swi 0      @ make system call (a.k.a. "software interrupt")
