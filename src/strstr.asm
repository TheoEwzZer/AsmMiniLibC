;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strstr

strstr:
    CMP BYTE [RSI], 0           ; Check if second string is empty
    JE  end                     ; If it is, jump to 'end'
    XOR RCX, RCX                ; Zero out RCX

outer_loop:
    CMP BYTE [RDI + RCX], 0     ; Check if first string is empty
    JE not_found                ; If it is, jump to 'not_found'
    XOR R8, R8                  ; Zero out R8

outer_inner_loop:
    CMP BYTE [RSI + R8], 0      ; Check if needle is empty
    JE end                      ; If it is, jump to 'end'

    MOV R9, RDI                 ; Move RDI to R9
    ADD R9, RCX                 ; Add RCX to R9
    CMP BYTE [R9 + R8], 0       ; Check if we reached the end of the haystack
    JE not_found                ; If it is, jump to 'not_found'

    MOV R9B, BYTE [R9 + R8]     ; Move current char of haystack to R9B
    CMP BYTE [RSI + R8], R9B    ; Compare current char of needle to current char of haystack
    JNE outer_continue          ; If they don't match, jump to 'outer_continue'

    INC R8                      ; If they match, increment needle pointer
    JMP outer_inner_loop        ; Keep looking

outer_continue:
    INC RCX                     ; Increment haystack pointer
    JMP outer_loop              ; Keep looking

inner_loop:
    CMP BYTE [RSI + R8], 0      ; Check if needle is empty
    JE end                      ; If it is, jump to 'end'
    MOV R9, RDI                 ; Move RDI to R9
    ADD R9, RCX                 ; Add RCX to R9
    CMP BYTE [R9 + R8], 0       ; Check if we reached the end of the haystack
    JE not_found                ; If it is, jump to 'not_found'
    MOV R9B, BYTE [R9 + R8]     ; Move current char of haystack to R9B
    CMP BYTE [RSI + R8], R9B    ; Compare current char of needle to current char of haystack
    JNE outer_loop              ; If they don't match, jump to 'outer_loop'
    INC R8                      ; If they match, increment needle pointer
    JMP inner_loop              ; Keep looking

not_found:
    XOR RAX, RAX                ; Zero out RAX
    RET                         ; Return NULL

end:
    LEA RAX, [RDI + RCX]        ; Load effective address of haystack begin pointer to RAX
    RET                         ; Return pointer to start of needle in haystack
