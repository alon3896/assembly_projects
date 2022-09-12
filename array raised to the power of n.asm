
;Alon Chitlaru
;Moran Mor
%include "io64.inc"
section .data
arr times 10 dq 0
pow dq 0
itemSize dq 8
section .text
global CMAIN
global INSERT
global POWINS
global power_array
global PRINTER

power_array:
     lea rbx, [arr]
     mov r11, 10
     push rbp
     mov rbp, rsp;
     mov r9, [rbp+16]
     cmp r9, 1
     je endofpow
     cmp r9, 0
     je zero
arrymover:
     push r9     
     mov r10, [rbx]
powering:
     mov rax, [rbx]
     mul r10
     mov [rbx],rax
     dec r9
     cmp r9,1
     jne powering
     add rbx, [itemSize]
     pop r9
     dec r11
     cmp r11, 0
     jz endofpow
     jmp arrymover
zero:
    mov r10, 0
    mov r12, 0
    mov RDX, 0
    mov rax, 0
    mov r12b, [rbx]
    mov al, r12b
    DIV r12d
    mov [rbx], rax
    add rbx, [itemSize]
    dec r11
    cmp r11, 0
    jnz zero

endofpow:
     pop rbp
     ret

INSERT:
     lea rbx, [arr]
     mov rdx,0
     mov rdx,10
again:
     cmp rdx,0
     jz end
     PRINT_STRING "Please enter a number"
     NEWLINE
     GET_DEC 4, [rbx]
     add rbx, [itemSize]
     dec rdx
     jmp again

end: ret
  
  
POWINS:
po:  
    NEWLINE 
    PRINT_STRING "Please enter positive number for power:  "
    GET_DEC 4, [pow]
    cmp word[pow], 0   
    jl po
    ret
            
CMAIN:
     mov rbp, rsp; for correct debugging
     mov qword[pow], 0
     call INSERT
     call POWINS
     PRINT_STRING "The arr before changing is: "
     NEWLINE
     call PRINTER
     push qword[pow]
     call power_array
     pop  qword[pow]
     PRINT_STRING "The arr after changing is: "
     NEWLINE
     call PRINTER
     PRINT_STRING "Please press any key to leave :)"
     GET_CHAR DL
     GET_CHAR DL
     xor rax, rax
     ret
        
PRINTER:
     mov rdx, 0
     mov rdx, 10
     lea rbx, [arr]
looprint:     
     cmp rdx,0
     jz endprint
     PRINT_DEC 4, [rbx]
     PRINT_CHAR ' '
     add rbx, [itemSize]
     dec rdx
     jmp looprint
endprint:
     NEWLINE
     ret   
   
     
; pelet/ output:
;Please enter a number
;1
;Please enter a number
;2
;Please enter a number
;3
;Please enter a number
;4
;Please enter a number
;5
;Please enter a number
;6
;Please enter a number
;7
;Please enter a number
;8
;Please enter a number
;9
;Please enter a number
;10

;Please enter positive number for power:  -9

;Please enter positive number for power:  -6

;Please enter positive number for power:  3
;The arr before changing is:
;1 2 3 4 5 6 7 8 9 10
;The arr after changing is:
;1 8 27 64 125 216 343 512 729 1000
;Please press any key to leave :)

  