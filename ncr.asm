;author : Priti Chattopadhyay

.model small                                    ; assembler directive to allocate memory
.data                                           ; data segment
   str1 db "Enter n: $"                         ; message 1 to enter n
   str2 db 10, 13, "Enter r: $"                 ; message 2 to enter r
   str3 db 10, 13, "Error n<r $"                ; error message if n < r
   str4 db 10, 13, "Factorial: $"               ; message 4 to print result
   n db ?                                       ; to store n
   r db ?                                       ; to store r
   nn db ?                                      ; to store n factorial
   rr db ?                                      ; to store r factorial
   diff db ?                                    ; to store n - r

.code                    ; code segment
        mov ax, @data    ; initialize ds register
        mov ds, ax

        lea dx, str1     ; to print message 1 to enter n
        mov ah, 09h
        int 21h

        mov ah, 1h       ; input value of n
        int 21h
        sub al, 30h      ; subtract 30 to convert it to integer

        mov n, al        ; store value of n in memory location 'n'

        mov ch, 0h       ; clear ch
        mov cl, n        ; move n to cl
        mov ax, 1h       ; initialize ax with 1
        call factorial   ; find factorial of n calling factorial procedure

        mov nn, al       ; store n factorial in nn

        lea dx, str2     ; to print message 2 to enter r
        mov ah, 09h
        int 21h

        mov ah, 1h       ; input value of r
        int 21h
        sub al, 30h      ; subtract 30 to convert it to integer

        mov r, al        ; store value of r in memory location 'r'

        mov ah, n        ; move n to ah
        cmp ah, al       ; compare n with input value
        jb printerr      ; if ah < al i.e. n < r, jump to print error message

        mov ch, 0h       ; clear ch
        mov cl, r        ; move r to cl
        mov ax, 1h       ; initialize ax with 1
        call factorial   ; find factorial of r calling factorial procedure

        mov rr, al       ; store r factorial in rr

        mov ah, n        ; move n to ah
        mov al, r        ; move r to al
        sub ah, al       ; store ah - al in ah

        mov diff, ah     ; move ah - al in diff

        mov ax, 1h     ; initialize ax with 1

        mov ch, 0h       ; clear ch
        mov cl, diff     ; move diff in cl
        call factorial   ; find factorial of n - r by calling factorial procedure

        mov cl, rr       ; move factorial of r to cl
        mul cl           ; multiply cl with al and place result in ax

        mov cl, al       ; move al to cl 
        mov al, nn       ; move n factorial to al
        div cl           ; divide al by cl and place quotient in al

        aam              ; ASCII adjust after multiplication

        mov bx, ax       ; store result to be printed in bx

        lea dx, str4     ; print result message
        mov ah, 09h
        int 21h

        add bx, 3030h    ; print result in integer format
        mov dl, bh
        mov ah, 02h
        int 21h
        mov dl, bl
        mov ah, 02h
        int 21h
        jmp exit         ; jump to exit

        printerr:
           lea dx, str3  ; print error message
           mov ah, 09h
           int 21h

        exit:            ; exit from the code
           mov ah, 4ch
           int 21h

        factorial proc   ; procedure to find factorial
           cmp cl, 0h    ; check whether cl is 0 or not
           je f0         ; if cl = 0, we don't need to find factorial so jump to f0
           f:
              mul cl     ; finding factorial by multiplying cl with al
              loop f     ; loop until cx = 0
              ret        ; return
              f0:        
                 ret     ; return
        factorial endp   ; end of factorial procedure
        end              ; end directive
