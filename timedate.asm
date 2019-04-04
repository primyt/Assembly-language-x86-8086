;author: Mrinal Pandey

.model small            ; assembler directive to allocate memory
                        ; no stack and data segment required here
.code                   ; code segment

        mov ah, 2ch     ; To get system time [HH in ch, MM in cl, SS in dh]
        int 21h         ; DOS interrupt to get time

        mov al, ch      ; hour in ch
        call disp       ; call disp procedure to display hour

        mov dl, ':'     ; copy : to dl to print
        mov ah, 02h     ; copy 02 to ah
        int 21h         ; DOS interrupt to display content in dl i.e. : 

        mov al, cl      ; minutes in cl
        call disp       ; call disp procedure to display minutes

        mov dl, ':'     ; To print : as above
        mov ah, 02h     
        int 21h         

        mov al, dh      ; seconds in dh as SS
        call disp       ; call disp procedure to display seconds

        mov dl, 0Dh     ; To print 0D [0D stands for \r]
        mov ah, 02h
        int 21h

        mov dl, 0Ah     ; To print 0A [0A stands for \n]
        mov ah, 02h
        int 21h

        mov ah, 2Ah     ; To get system date [DD in dl , MM in dh, YYYY in cx]
        int 21h         ; DOS interrupt to get date

        mov al, dl      ; day in dl
        call disp       ; call disp procedure to display day
        mov dl, '/'     ; To print /
        mov ah, 02h
        int 21h

        mov al, dh      ; month in dh
        call disp       ; call disp procedure to display month
        mov dl, '/'     ; To print /
        mov ah, 02h
        int 21h

        add cx, 0F830h  ; Add 0F830 to adjust hexadecimal effects on year
        mov ax, cx      ; year in ax 
        call disp       ; call disp procedure to display year

        mov dl, 0Dh     ; To print 0D [\r]
        mov ah, 02h
        int 21h

        mov dl, 0Ah     ; To print 0A [\n]
        mov ah, 02h
        int 21h

        mov ah, 4ch     ; For ending program with return code
        int 21h         ; DOS Interrupt

        disp proc       ; Beginning of disp procedure

          aam           ; ASCII adjust after multiplication [ax register]
          mov bx, ax    ; loading adjusted value to bx
          add bx, 3030h ; Add 3030 to properly print the data

          mov dl, bh    ; To print first digit of data
          mov ah, 02h
          int 21h
          mov dl, bl    ; To print second digit of data
          mov ah, 02h
          int 21h
          ret           ; return from the procedure
          disp endp     ; end display procedure

        end             ; end program
                                                             
