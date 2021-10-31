%include "io.inc"

section .data 

    arr dd 4,2,4,10,8
    
section .text
global CMAIN
Show:
    mov esi,arr + 4
    mov ecx,[arr]
    A:
        PRINT_DEC 2,[esi]
        add esi,4
    LOOP A
    mov esi,arr +4
    mov ecx,[arr]
    NEWLINE
    ret

CMAIN:

    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ecx,[arr]
    mov ecx, eax; Iters
    call Show
    mov eax,[arr]
AGAIN:
    mov esi,arr+4
    mov ecx,[arr]
    FOR_j:
        mov edx,[esi]
        mov ebx,[esi+4]
        cmp edx,ebx
        JG L1
        JMP L2
    L1:
            push dword [esi]
            push dword [esi + 4]
            pop dword [esi]
            pop dword [esi + 4]
    L2:
        add esi,4
        LOOP FOR_j
    sub eax,1
    jnz AGAIN
    call Show
    ret

    
