;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strrchr

strrchr:
    MOV RCX, -1                 ; Initialize RCX to -1
    MOV RAX, RDI                ; Copy the string pointer to RAX

find_end:
    INC RCX                     ; Increase RCX
    CMP BYTE [RAX + RCX], 0     ; Compare byte with 0
    JNE find_end                ; If not equal, jump to 'find_end'

previous_char:
    CMP BYTE [RAX + RCX], SIL   ; Compare byte with SIL
    JE  found                   ; If equal, jump to 'found'
    DEC RCX                     ; Decrease RCX
    JNS previous_char           ; If RCX is not negative, jump to 'previous_char'
    XOR RAX, RAX                ; Zero out RAX
    RET                         ; Return NULL

found:
    LEA RAX, [RDI + RCX]        ; Load address of found char. LEA is used to calculate the memory address of the found character and store it in RAX.
    RET                         ; Return address of found char
