;author : Mrinal Pandey

.model small           ; assembler directive to allocate memory
.data                  ; data segment
        a db 04h       ; a = 4
        b db 02h       ; b = 2
.code                  ; code segment
        mov ax, @data  ; initialize ds register
        mov ds, ax

        mov ax, 0h     ; clearing contents of ax, bx and cx for better observance
        mov bx, 0h
        mov cx, 0h

        mov al, a      ; move a to al
        mov bl, b      ; move b to bl
        mov cl, b      ; move b to cl

        add al, bl     ; add al and bl and store the sum in al
        sub al, bl     ; subtract bl from al and store result in al
        mul cl         ; multiply al with cl and store the product in al
        div cl         ; divide al by cl and store quotient in al and remainder in ah

        mov ah, 4ch    ; terminate with return code
        int 21h
        end            ; end directive
