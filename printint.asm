;author : Mrinal Pandey

.model small            ; assembler directive to allocate memory
.data                   ; data segment
        n db 9h         ; number to be printed
.code                   ; code segment
        mov ax, @data   ; initialize the ds register
        mov ds, ax

        mov bl, n       ; move the number to bl register
        add bl, 30h     ; convert it to ASCII character by adding 30 to it
        mov dl, bl      ; move content of bl to dl for character printing
        mov ah, 02h
        int 21h

        mov ah, 4ch     ; terminate with return code
        int 21h
        end             ; end directive
