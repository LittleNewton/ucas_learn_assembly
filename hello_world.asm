; hello_world.asm
; URL: https://www.youtube.com/watch?v=HgEGAaYdABA
; Date: 2019-oct-20

global _start

section .text:

_start:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_length
    int 0x80                ; invoke the syscall

    ; now gracefully exit

    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data
    message: db "Hello World!", 0xA
    message_length equ $-message