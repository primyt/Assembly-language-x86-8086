;author: Mrinal Pandey

.model small                    ; assembler directive to allocate memory

.data                           ; beginning of data segment

  n dw 5555h, 4444h, 3333h, 2222h, 1111h
  ; array of 5 16-bit hexadecimal values

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
            mov ax, [si]        ; copy [si] to ax
            mov bx, [si+2]      ; copy [si+2] to bx
            cmp ax, bx          ; compare ax and bx
            jb next             ; jump to next if ax < bx
            mov [si], bx        ; Swapping 
            mov [si+2], ax      ; Swapping

            next:               ; label next
            add si, 02h         ; increase si by two [16-bit]
            dec dx              ; decrease dx by one
          jnz innerloop         ; jump to innerloop if zero flag != 1
        loop outerloop          ; jump to outerloop if cx != 0 and decrease
                                ;                                 cx by one
        int 3h                  ; Breakpoint interrupt
        align 16                ; alignment of your output data                         
        end                     ; end directive
