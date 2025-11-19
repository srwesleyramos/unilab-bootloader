;;
;; CLEAR SCREEN
;;

clear:
    mov ax, 0003h
    int 10h
    ret

;;
;; PRINT STRING
;;

print:
    push si
    push ax
    push bx

print_loop:
    lodsb

    or al, al
    jz print_done

    mov ah, 0x0e
    mov bh, 0
    int 10h

    jmp print_loop

print_done:
    pop bx
    pop ax
    pop si
    ret

;;
;; READ KEYBOARD
;;

scan:
    mov ah, 00h
    int 16h
    mov ah, 0x0e
    int 10h
    ret
