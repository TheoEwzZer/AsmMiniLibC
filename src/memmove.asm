;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  memmove

memmove:
    CMP RSI, RDI                ; Compare source with destination
    JA  copy_forward            ; If source > destination, go forward
    JE  end                     ; If source = destination, return destination
    JMP copy_backward           ; If source < destination, go backward

copy_forward:
    XOR RCX, RCX                ; Zero out RCX

forward_loop:
    CMP RCX, RDX                ; Compare RCX with length
    JZ  end                     ; If RCX = length, return destination
    MOV BYTE AL, [RSI + RCX]    ; Move source to AL
    MOV BYTE [RDI + RCX], AL    ; Move AL to destination
    INC RCX                     ; Increment RCX
    JMP forward_loop            ; Repeat forward_loop

copy_backward:
    LEA RCX, [RDX - 1]          ; Load effective address of length - 1 into RCX

backward_loop:
    CMP RCX, -1                 ; Compare RCX with -1
    JZ  end                     ; If RCX = -1, return destination
    MOV BYTE AL, [RSI + RCX]    ; Move source to AL
    MOV BYTE [RDI + RCX], AL    ; Move AL to destination
    DEC RCX                     ; Decrement RCX
    JMP backward_loop           ; Repeat backward_loop

end:
    MOV RAX, RDI                ; Move destination to RAX
    RET                         ; Return destination
