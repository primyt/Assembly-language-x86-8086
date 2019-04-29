;author : Priti Chattopadhyay

.model small                              ; assembler directive to allocate memory
.data                                     ; data segment
        msg1 db 10,13,"prim proc msg1 $"  ; message 1 to be printed
        msg2 db 10,13,"prim proc msg2 $"  ; message 2 to be printed
.code                                     ; code segment
        mov ax,@data                      ; initialize the ds register
        mov ds,ax
        lea dx,msg1                       ; load effective address of msg1 into dx
        call prim                         ; call prim procedure
        lea dx,msg2                       ; load effective address of msg2 into dx
        call prim                         ; call prim procedure

        mov ah,4ch                        ; terminate with return code
        int 21h                           ; call the interrupt

 prim proc                                ; prim procedure definition
        mov ah,09h                        ; using 09 function of int 21h to print content at address present in dx
        int 21h                           ; call the interrupt
        ret                               ; return from the procedure to the place where it was called
        prim endp                         ; end procedure
 end                                      ; end directive
