%include "io.inc"

section .data 

    arr dd 1,3,2,5,7,3
    l dd 6
    
section .text
global CMAIN

CMAIN:

    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ecx,[arr]
    mov ecx, eax; Iters
    mov esi,arr
    mov ecx,[l]
    A:
        PRINT_DEC 2,[esi]
        PRINT_CHAR ','
        add esi,4
    DEC ecx
    JNZ A
    mov esi,arr +4
    mov ecx,[l]
    DEC ecx
    NEWLINE
    mov eax,[arr]
RESTART:
    mov esi,arr
    mov ecx,[l]
    DEC ecx
    NERQIN:
        mov edx,[esi]
        mov ebx,[esi+4]
        cmp edx,ebx
        JL L1
        JMP L2
    L1:
            mov ebx,[esi]
            mov eax,[esi+4]
            mov [esi],eax
            mov [esi+4],ebx
    L2:
        add esi,4
        LOOP NERQIN
    sub eax,1
    jnz RESTART
    mov esi,arr
    mov ecx,[l]
    B:
        PRINT_DEC 2,[esi]
        PRINT_CHAR ','
        add esi,4
    DEC ecx
    JNZ B
    mov esi,arr +4
    mov ecx,[arr]
    NEWLINE
    ret