;author: Mrinal Pandey

.model small                    ; assembler directive to allocate memory

.data                           ; beginning of data segment

  n db 55h, 44h, 33h, 22h, 11h  ; array of 5 8-bit hexadecimal values
  len equ 5                     ; len = 5

.code                           ; beginning of code segment
        mov ax, @data           ; beginning address of data is moved to ax
        mov ds, ax              ; initialize ds register

        mov cx, len             ; initialize cx register
        dec cx                  ; decrease cx by one

        outerloop:              ; label outerloop 
          lea si, n             ; load effective address of array in si
          mov dx, cx            ; initialize dx with current value of cx

          innerloop:            ; label innerloop
            mov ah, [si]        ; copy [si] to ah
            mov al, [si+1]      ; copy [si+1] to al
            cmp ah, al          ; compare ah and al
            jb next             ; jump to next if ah < al
            mov [si], al        ; Swapping 
            mov [si+1], ah      ; Swapping

            next:               ; label next
            inc si              ; increase si by one
            dec dx              ; decrease dx by one
          jnz innerloop         ; jump to innerloop if zero flag != 1
        loop outerloop          ; jump to outerloop if cx != 0 and decrease
                                ;                                 cx by one
        int 3h                  ; Breakpoint interrupt
        align 16                ; alignment of your output data                         
        end                     ; end directive
