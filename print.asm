;author : Priti Chattopadhyay

.model small          ; assembler directive to allocate memory
.data                 ; data segment
        char db ?     ; variable named char to store input character
.code                 ; code segment
        mov ax,@data  ; initialize the ds register
        mov ds,ax

        mov ah,01h    ; input the character and store in al
        int 21h       

        mov char,al   ; move input character in al to char variable
        mov dl,0ah    ; move character to be printed in dl, i.e. 0a[\n] here
        mov ah,02h    ; use interrupt function 02
        int 21h       ; call the interrupt

        mov dl,0dh    ; To print 0d[\r]
        mov ah,02h
        int 21h

        mov dl,char   ; To print the data in variable char
        mov ah,02h
        int 21h

        mov dl, 'a'   ; To print 'a' as it is
        mov ah,02h
        int 21h

        mov dl,30h    ; 30h = 47d i.e. ASCII equivalent of '0', prints 0
        mov ah,02h
        int 21h

        mov ah,4ch    ; Terminate with return code
        int 21h
        end           ; end directive

        

