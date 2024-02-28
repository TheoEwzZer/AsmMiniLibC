;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  index

index:
    MOV RCX, -1                 ; Initialize RCX to -1

next_char:
    INC RCX                     ; Increase RCX
    CMP BYTE [RDI + RCX], SIL   ; Compare byte with SIL
    JE  found                   ; If equal, jump to 'found'
    CMP BYTE [RDI + RCX], 0     ; Compare byte with 0
    JNE next_char               ; If not equal, jump to 'next_char'
    XOR RAX, RAX                ; Zero out RAX
    RET                         ; Return NULL

found:
    LEA RAX, [RDI + RCX]        ; Load address of found char. LEA is used to calculate the memory address of the found character and store it in RAX.
    RET                         ; Return address of found char
