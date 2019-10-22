section .data
    num1: dd 2
    num2: dd 4

section .text
global _main, _sum

_main:
    mov eax, 10
    dec eax
    mov ebx, 5

    push dword [num2]
    push dword [num1]
    call _sum
    add esb, 8

    add eax, ebx
    dec eax

    mov eax, 1
    mov ebx, 0
    int 0x80

_sum:
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp + 8]
    mov eax, [ebp + 12]
    add eax, ebx
    pop ebx
    pop ebp
    ret
