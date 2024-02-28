;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strlen

strlen:
    XOR RCX, RCX            ; Counter set to 0
    JMP check_end           ; Jump to 'check_end'

count:
    INC RCX                 ; Counter increased

check_end:
    CMP BYTE [RDI + RCX], 0 ; Compare byte at (RDI + RCX) with 0
    JNE count               ; If byte not 0, jump to 'count'
    MOV RAX, RCX            ; Move count to RAX
    RET                     ; Return string length
