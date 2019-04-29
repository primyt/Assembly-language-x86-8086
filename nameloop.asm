;author : Mrinal Pandey

.model small                         ; assembler directive to allocate memory
.data                                ; data segment
        str db "Donald", 10, 13, "$" ; string to be printed
        len equ 5                    ; count for the loop
.code                                ; code segment
        mov ax, @data                ; initialize ds register
        mov ds, ax

        mov cx, len                  ; move count to count register
        printname:                   ; label for loop
                lea dx, str          ; to print the string
                mov ah, 09h
                int 21h
                loop printname       ; decrement cx by one and loop to printname until cx != 0
        mov ah, 4ch                  ; terminate with return code
        int 21h                      ; call the interrupt
        end                          ; end directive
