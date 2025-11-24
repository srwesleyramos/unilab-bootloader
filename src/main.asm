[bits 16]
[org 0x8000]

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov sp, 0x8000

menu:
    call clear_screen
    mov si, SELECT_MENU
    call print_string

halt:
    jmp halt

%include "src/utils/lang.asm"
%include "src/utils/utils.asm"

times (5*512) - ($ - $$) db 0
