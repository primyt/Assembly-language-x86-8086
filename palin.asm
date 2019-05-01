;author : Mrinal Pandey

.model small                             ; assembler directive to allocate memory

.data                                    ; data segment

   str db "ABC1221CBA$"                  ; string to be checked
   len dw $-str                          ; length of str
   strrev db 20 dup(' ')                 ; to hold reversed string
   msg1 db "Palindrome", 10, 13, "$"     ; message to be printed if str is palindrome
   msg2 db "Not Palindrome", 10, 13, "$" ; message to be printed if str is not palindrome

.code                       ; code segment

   mov ax, @data            ; initialize ds register
   mov ds, ax
   mov es, ax               ; initialize es register

   mov cx, len              ; mov len to cx
   add cx, -2               ; to get actual length of string

   lea si, str              ; load effective address of str in si
   lea di, strrev           ; load effective address of strrev in di
   add si, len              ; make si point to end of string
   add si, -2               ; make si point to last character of string

   reverse:                 ; label reverse
     mov al, [si]           ; move content at si, i.e. last character in str, to al
     mov [di], al           ; now move al to di i.e. beginning of strrev
     inc di                 ; increment di
     dec si                 ; decrement si
     loop reverse           ; loop to reverse

     mov al, [si]           ; copy the remained character in str to strrev
     mov [di], al
     inc di                 ; increment di
     mov byte ptr[di], "$"  ; append $ to mark end of strrev

     cld                    ; set direction flag to 0
     mov cx, len            ; move length of string to cx
     lea si, str            ; load effective address of str in si
     lea di, strrev         ; load effective address of strrev in di
     repe cmpsb             ; compare two string bytes and repeat the comparison if they're equal and if cx hasn't become 0 yet

     jz palin               ; if zero flag is 1, jump to label palin 

     notpalin:              ; label notpalin
       lea dx, msg2         ; to print message 2 i.e. Not palindrome
       mov ah, 09h
       int 21h
       jmp exit             ; jump to exit

     palin:                 ; label palin
       lea dx, msg1         ; to print message 1 i.e. Palindrome
       mov ah, 09h
       int 21h

     exit:                  ; exit label
       mov ah, 4ch          ; terminate with return code
       int 21h              ; DOS interrupt
       end                  ; end directive
