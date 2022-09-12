;Alon Chitlaru

%include "io64.inc"
section .data
arA dw 4, 3, 12, 3, -3, 4, 6, 8, 12, -3
lenA equ $-arA
arB  times lenA/2 dw 0
normal equ 2
lenAnormal equ lenA/normal
lenBnormal equ lenAnormal/2



section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov rax,0
    lea rbx, [arB]
    LEA rax, [arA]
    mov rcx, lenAnormal
    mov rdx, 0
    PRINT_STRING "the old arry is:" 
    NEWLINE
printOG: 
      
    PRINT_DEC 2, [rax]
    PRINT_STRING " "
    add rax , normal
    dec rcx
    cmp rcx,0
    jne printOG
    NEWLINE

           
    mov rcx, lenBnormal
    mov rax,0
    LEA rax, [arA]
    lea rbx, [arB] 
    
    
 fillB: 
    mov dx, 0
    mov dx ,[rax]
    add dx, [rax+normal]
    mov [rbx], rdx
    add rax,normal*2  
    add rbx, normal*1
    dec rcx
    cmp rcx,0
    jne fillB
    
    
    lea rbx, [arB]
    mov rcx, lenBnormal
    mov rax, 0
    
    PRINT_STRING "it's been a bumpy raod with alot of ups and downs but in the end the new arry is:"
    NEWLINE
    printB:
    PRINT_DEC 2,[rbx]
    PRINT_STRING " "
    add rbx, normal
    dec rcx
    cmp rcx,0
    jne printB 
    
    xor rax, rax
    ret
    
;     pelet/output
;    the old arry is:
;    4 3 12 3 -3 4 6 8 12 
;    it's been a bumpy raod with alot of ups and downs but in the end the new arry is:
;    7 15 1 14 9 