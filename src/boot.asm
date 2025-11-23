[bits 16]
[org 0x7C00]

start:
    mov [BOOT_DRIVE], dl

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov sp, 0x7C00
    mov bx, 0x8000

    mov ah, 0x02
    mov al, 1               ; amount
    mov ch, 0               ; cylinder
    mov cl, 2               ; sector
    mov dh, 0               ; head
    mov dl, [BOOT_DRIVE]

    int 0x13
    jc error

    jmp 0x0000:0x8000

error:
    mov si, BOOT_FAILED

print:
    lodsb

    or al, al
    jz $

    mov ah, 0x0E
    int 0x10

    jmp print

BOOT_DRIVE:
    db 0

BOOT_FAILED:
    db "An error occurred to load the disk...", 0

times 510 - ($ - $$) db 0
dw 0AA55H
