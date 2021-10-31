%include "io.inc" 
 
section .data 
A dd 5 
B dd 4 
C dd 4 
D dd 7 
E dd 8 
F dd 3 
K dd 2 
L dd 2 
 
Q dd 0 
R dd 0 
section .text 
global CMAIN 
CMAIN: 
    mov ebp, esp; for correct debugging 
    ;write your code here 
    xor eax, eax 
     
    ; ac - bd/(ek+fl) 
    ; 20 - 28/(16+6) = 20 - 28/22 = 19 (mnacord 6) 
     
    mov ecx,[E] 
    imul ecx,[K] 
     
    mov eax,[F] 
    imul eax,[L] 
     
    ; ecx = ek + fl 
    add ecx,eax 
     
    mov eax,[B] 
    imul eax,[D] 
    xor edx,edx 
    idiv ecx 
    mov [Q],eax 
    mov [R],edx 
    ; eax = bd/(ek+fl) 
     
    mov eax,[A] 
    imul eax,[C] 
    sub eax,[Q] 
     
    PRINT_DEC 4,eax 
    NEWLINE 
    PRINT_DEC 4,[R] 
     
     
    ret