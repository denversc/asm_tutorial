# Hello World
# By: Denver Coneybeare
# June 24, 2014
#
# From the book "Assembly Language Step-by-Step: Programming with Linux, Third Edition"

.intel_syntax noprefix

.data

.Lmessage:
    .string "Hello World\n"

.text

.global _start

_start:
    nop                  # to keep GDB happy

    mov rax, 1           # 1 is the Linux x86_64 sys_write system call
    mov rdi, 1           # 1 is standard output
    mov rsi, OFFSET .Lmessage   # the address of the message
    mov rdx, 12          # the length of the message
    syscall              # perform the system call

    mov rax, 60          # 60 is the Linux x86_64 exit system call
    mov rdi, 0           # the exit code, 0
    syscall              # perform the system call
