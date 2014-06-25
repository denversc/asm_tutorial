; Hello World
; By: Denver Coneybeare
; June 24, 2014
;
; From the book "Assembly Language Step-by-Step: Programming with Linux, Third Edition"
BITS 64

SECTION .data

message: db "Hello World!",10
messageLen: equ $-message

SECTION .bss

SECTION .text

global _start

_start:
    nop                  ; to keep GDB happy

    mov rax, 1           ; 1 is the Linux x86_64 sys_write system call
    mov rdi, 1           ; 1 is standard output
    mov rsi, message     ; the address of the message
    mov rdx, messageLen  ; the length of the message
    syscall              ; perform the system call

    mov rax, 60          ; 60 is the Linux x86_64 exit system call
    mov rdi, 0           ; the exit code, 0
    syscall              ; perform the system call
