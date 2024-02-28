;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  memcpy

memcpy:
    MOV RAX, RDI           ; Destination address to RAX
    MOV RCX, RDX           ; Byte count to RCX

loop:
    CMP RCX, 0             ; Compare RCX with 0
    JE end                 ; If RCX is 0, jump to 'end'
    MOV DL, BYTE [RSI]     ; Load byte from source
    MOV BYTE [RDI], DL     ; Store byte at destination
    INC RDI                ; Move to next byte in destination
    INC RSI                ; Move to next byte in source
    DEC RCX                ; Decrease byte count
    JMP loop               ; Repeat until all bytes copied

end:
    RET                    ; Return destination address
