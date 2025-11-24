current_style db 0x07

;;
;; clear
;;

clear_screen:
    mov ah, 0x06
    mov al, 0
    mov bh, [current_style]
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    mov ah, 0x02
    mov bh, 0x00
    mov dh, 0x00
    mov dl, 0x00
    int 0x10
    ret

;;
;; print
;;

print_string:
    lodsb

    or al, al
    jz print_done

    mov ah, 0x0E
    int 0x10

    jmp print_string

print_done:
    ret
