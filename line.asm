;author : Mrinal Pandey

.model small                               ; assembler directive to allocate memory
.data                                      ; data segment
        str db "Hello World", 10, 13, "$"  ; variable str to store message to be printed
                                           ; (10[\n] to change line, 13[\r] for carriage return)
.code                                      ; code segment
        mov ax, @data                      ; initialize ds register
        mov ds, ax

        lea dx, str                        ; load effective address of str in dx
        mov ah, 09h                        ; use 09 function of int 21h
        int 21h                            ; call interrupt to print the content present at address in dx

        mov ah, 4ch                        ; function to terminate with return code
        int 21h                            ; call the interrupt
        end                                ; end directive
