;Alon Chitlaru

%include "io64.inc"
section .data
temp dw 0
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
NoGood:
     mov rax, 0
     mov rbx, 0
     mov rcx, 0
    PRINT_STRING "pls enter positive number"
    GET_DEC 8, rax
    cmp rax, 0
    jl NoGood
    mov rbx, rax
    and rax, 00001b
    jz even
    jmp odd
    
 even:
    mov dword[temp], 0
    mov rcx,rbx
    SHL rcx, 1
    jmp print
    
 odd:
    mov dword[temp], 0
    mov rcx,rbx
    SHR rcx, 1
    jc lefthalf
 secshift: 
    shr rcx, 1
    jnc divleft
    add dword[temp],25
    jmp print 
divleft:
    shr dword[temp],1
    jmp print         
 lefthalf:
    add dword[temp],50
    jmp secshift
    
                                  
 print: 
    NEWLINE
    PRINT_DEC 4 , rbx
    PRINT_STRING " after calculate is: "
    PRINT_DEC 4 , rcx 
    PRINT_STRING "."
    PRINT_DEC 4 , [temp] 
    GET_DEC 4, rax                                                                                          
    xor rax, rax
    ret
    ; 2 possible outputs
    
    ;even number:
    ;pls enter positive number
    ;22 after calculate is: 44.0
    
    ;odd number
    ;pls enter positive number
    ;21 after calculate is: 5.25