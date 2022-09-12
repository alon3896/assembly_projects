;Alon Chitlaru
%include "io64.inc"
section .data
section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
NoGood:
    
    mov rax, 0
    PRINT_STRING "pls enter positive number"
    GET_DEC 8, rax
    cmp rax, 0
    jl NoGood
    inc rax 
    mov rbx, 0
   
outerloop:
    
    NEWLINE
    mov rcx, 1
    cmp rbx, rax
    je end
    inc rbx
innerloop:
        
    PRINT_DEC 4, rcx
    cmp rcx,rbx
    je outerloop
    inc rcx
    jmp innerloop
    
end:
   GET_DEC 4, rcx    


    xor rax, rax
    ret
    
    ;pls enter positive number4

;1
;12
;123
;1234
;12345
