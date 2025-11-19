org 0x7c00
bits 16

;;
;; PROGRAMA PRINCIPAL
;;

main:
    ;; inicializando registradores

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov sp, 0x7c00

main_select:
    ;; imprimindo bem-vindo na tela

    call clear
    mov si, welcome_message
    call print

    ;; verificando entrada do usuário

    call scan

    ;; retorno para entrada errada

    jmp main_select

;;
;; IMPORTANDO ARQUIVOS
;;

%include "src/utils/utils.asm"
%include "src/utils/locale.asm"

times 510-($-$$) db 0
dw 0AA55h