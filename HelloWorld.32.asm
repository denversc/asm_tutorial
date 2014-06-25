; Hello World
; By: Denver Coneybeare
; June 24, 2014
;
; From the book "Assembly Language Step-by-Step: Programming with Linux, Third Edition"
BITS 32

SECTION .data

message: db "Hello World!",10
messageLen: equ $-message

SECTION .bss

SECTION .text

global _start

_start:
    nop                  ; to keep GDB happy

    mov eax, 4           ; 4 is the Linux i386 sys_write system call
    mov ebx, 1           ; 1 is standard output
    mov ecx, message     ; the address of the message
    mov edx, messageLen  ; the length of the message
    int 80H              ; perform the system call

    mov eax, 1           ; 1 is the Linux i386 exit system call
    mov ebx, 0           ; the exit code, 0
    int 80H              ; perform the system call
