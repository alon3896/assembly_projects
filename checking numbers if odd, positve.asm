; Alon Haim Chitlaru 
; Moran Mor 
%include "io64.inc"
section .data
posCounter dq 0
negCounter dq 0
oddCounter dq 0
evenCounter dq 0
negSum dq 0
posSum dq 0
oddSum dq 0
evenSum dq 0

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    PRINT_STRING "welcome to the number counter"
    NEWLINE
    PRINT_STRING " please entr number"
again:   
    mov rbx, 0
    mov rax, 0
    GET_DEC 4, rax
    cmp rax, 0 
    jz exit
    jmp oddcheck
posOneg:
    cmp rbx,0    
    jl negative
    jnl positive
    
oddcheck:
    mov rbx,rax
    and al, 0000001b
    jz even   
    inc qword[oddCounter]
    add [oddSum], rbx
    jmp posOneg
    
even:
    inc qword[evenCounter]
    add [evenSum], rbx
    jmp posOneg

negative:
     add [negSum], rbx
     inc qword[negCounter]
     jmp again 
     
positive:
     add [posSum], rbx
     inc qword[posCounter]
     jmp again
exit:
    NEWLINE
    PRINT_STRING "the summ of all odd number you entered is: "
    PRINT_DEC 4, [oddSum]
    NEWLINE
    PRINT_STRING "the amount of odd number is "
    PRINT_DEC 4, [oddCounter]
      NEWLINE
    PRINT_STRING "the summ of all even number you entered is: "
    PRINT_DEC 4, [evenSum]
    NEWLINE
    PRINT_STRING "the amount of even number is "
    PRINT_DEC 4, [evenCounter]
      NEWLINE
    PRINT_STRING "the summ of all positive number you entered is: "
    PRINT_DEC 4, [posSum]
    NEWLINE
    PRINT_STRING "the amount of positive number is "
    PRINT_DEC 4, [posCounter]
      NEWLINE
    PRINT_STRING "the summ of all negative number you entered is: "
    PRINT_DEC 4, [negSum]
    NEWLINE
    PRINT_STRING "the amount of negative number is "
    PRINT_DEC 4, [negCounter]
      NEWLINE
    
    GET_DEC 4 , rbx
    xor rax, rax
    ret
    
 ;output/pelet   
;welcome to the number counter
; please entr number1
;2
;3
;4
;5
;-1
;-2
;-3
;-4
;-5
;0

;the summ of all odd number you entered is: 0
;the amount of odd number is 6
;the summ of all even number you entered is: 0
;the amount of even number is 4
;the summ of all positive number you entered is: 15
;the amount of positive number is 5
;the summ of all negative number you entered is: -15
;the amount of negative number is 5


    