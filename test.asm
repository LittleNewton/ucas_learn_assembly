global _start

section .text
_start:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_length
    int 0x80                ; invoke the syscall

    ; --------------------------- Break ---------------------------
    ;mov eax, 10             ; 赋值
    ;add eax, hexLiteral     ; eax + hexLiteral => eax
    ;inc eax                 ; eax ++
    ;mov DWORD [tmp], eax    ; eax => tmp
                            ; 保留 eax 的值到 tmp 变量中
    mov eax, 0x4    ; 调用 write
    mov ebx, 1      ; 默认的 buffer
    mov ecx, tmp    ; 写入 tmp 的值
    mov edx, 1      ; 1 字节
    int 0x80        ; int 0x80，进行内核调用

    ; now gracefully exit
    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data
    decimalLiteral: db  31
    hexLiteral:     db  0xFF
    charLiteral:    db  'A'
    message:        db  "Hello World!", 0xA
    message_length: equ $-message
    tmp:            db  57                  ; 字符 9 的 ASCII 码是 57

stringLiteral:
    db "This is a string that", 0ah
    db "has a line break in it.", 0
lenString: equ ($ - stringLiteral)

section .bss
    unInitVariable: RESD 1
