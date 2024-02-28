;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  memset

memset:
    MOV RAX, RDI                ; Move RDI to RAX
    XOR RCX, RCX                ; Zero out RCX

loop:
    CMP RCX, RDX                ; Compare RCX with RDX
    JE end                      ; If equal, jump to 'end'
    MOV BYTE [RAX + RCX], SIL   ; Set byte at destination to SIL. SIL is the lower 8 bits of RSI
    INC RCX                     ; Increment RCX
    JMP loop                    ; Jump to 'loop'

end:
    RET                         ; End function
