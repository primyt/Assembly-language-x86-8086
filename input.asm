;author : Priti Chattopadhyay

.model small         ; assembler directive to allocate memory
.code                ; code segment
        mov ah,01h   ; 01 function of int 21h to input a character
        int 21h      ; calling the interrupt

        int 3h       ; breakpoint interrupt to view the contents of all registers
        end          ; end directive
        
        

