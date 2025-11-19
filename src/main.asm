ORG 0x7c00
BITS 16

;;
;; PROGRAMA PRINCIPAL
;;

main:
    ;; zerando os registradores

    XOR ax, ax
    MOV ds, ax
    MOV es, ax
    MOV ss, ax

    ;; definindo o ponto inicial

    MOV sp, 0x7c00

    ;; imprimindo mensagem inicial

    CALL clear
    MOV si, welcome
    CALL print

main_halt:
    HLT
    JMP main_halt

;;
;; UTILS - PRINT
;;

print:
    PUSH si
    PUSH ax
    PUSH bx

print_loop:
    ;; recebendo apenas um caractere

    LODSB

    ;; verificando se encontra o fim

    OR al, al
    JZ print_done

    ;; imprimindo na tela principal

    MOV ah, 0x0e
    MOV bh, 0
    INT 0x10

    ;; imprimindo o restante da mensagem

    JMP print_loop

print_done:
    POP bx
    POP ax
    POP si
    RET

;;
;; UTILS - CLEAR
;;

clear:
    MOV ax, 0003h
    INT 10h
    RET

;;
;; OUTRAS COISAS
;;

welcome: DB 0x0d, 0x0a
         DB "Bootloader by @srwesleyramos", 0x0d, 0x0a
         DB 0x0d, 0x0a
         DB "Escolha o que deseja fazer:", 0x0d, 0x0a
         DB 0x0d, 0x0a
         DB "1. Alterar a cor de fundo", 0x0d, 0x0a
         DB "2. Alterar a cor do texto", 0x0d, 0x0a
         DB "3. Carregar imagem na tela", 0x0d, 0x0a
         DB "4. Executar exercicio #1", 0x0d, 0x0a
         DB "5. Executar exercicio #2", 0x0d, 0x0a
         DB "6. Executar exercicio #3", 0x0d, 0x0a
         DB "7. Executar algoritmo em C", 0x0d, 0x0a
         DB 0x0d, 0x0a
         DB ">> ", 0

TIMES 510-($-$$) DB 0
DW 0AA55h