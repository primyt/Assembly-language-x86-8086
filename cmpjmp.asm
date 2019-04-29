;author : Priti Chattopadhyay

.model small                  ; assembler directive to allocate memory
.data                         ; data segment
         msg1 db 10,13,"a>b$" ; message to be printed if a>b
         msg2 db 10,13,"a<b$" ; message to be printed if a<b
         msg3 db 10,13,"a=b$" ; message to be printed if a=b
         a db 2h              ; Different values of a and b for different scenarios
         b db 2h
        ;a db 3h
        ;b db 5h
        ;a db 7h
        ;b db 1h
.code                         ; code segment
        mov ax,@data          ; initialize ds register
        mov ds,ax

        mov ah, a             ; mov a to ah
        mov al, b             ; mov b to al
        cmp ah,al             ; compare ah and al
                              ; ah<al cf=1, ah>al cf=0, ah=al zf=1 [jc jnc jz jnz]
        jc label2             ; jump to label2 if ah<al i.e. cf=1
        jz label3             ; jump to label3 if ah=al i.e. zf=1

 label1:
        lea dx, msg1          ; to print message 1[a>b]
        mov ah,09h
        int 21h
        jmp exit              ; unconditional jump to exit
 label2:
        lea dx,msg2           ; to print message 2[a<b]
        mov ah,09h
        int 21h
        jmp exit              ; unconditional jump to exit
 label3:
        lea dx,msg3           ; to print message 3[a=b]
        mov ah,09h
        int 21h
 exit:                        ; exit label
        mov ah,4ch            ; terminate with return code
        int 21h               ; call the interrupt
        end                   ; end directive
