;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strcasecmp

strcasecmp:
    XOR RAX, RAX        ; Zero out RAX

loop:
    MOV AL, BYTE [RDI]  ; Load byte from first string
    MOV BL, BYTE [RSI]  ; Load byte from second string
    CMP AL, 'a'         ; Compare AL to 'a'
    JL not_lower1       ; If AL is less than 'a', jump to not_lower1
    CMP AL, 'z'         ; Compare AL to 'z'
    JG not_lower1       ; If AL is greater than 'z', jump to not_lower1
    SUB AL, 32          ; Subtract 32 from AL to convert it to uppercase

not_lower1:             ; Label for when AL is not a lowercase letter
    CMP BL, 'a'         ; Compare BL to 'a'
    JL not_lower2       ; If BL is less than 'a', jump to not_lower2
    CMP BL, 'z'         ; Compare BL to 'z'
    JG not_lower2       ; If BL is greater than 'z', jump to not_lower2
    SUB BL, 32          ; Subtract 32 from BL to convert it to uppercase

not_lower2:
    CMP AL, BL          ; Compare bytes again
    JNE end             ; If not equal, jump to 'end'
    INC RDI             ; Move to next byte in first string
    INC RSI             ; Move to next byte in second string
    TEST AL, AL         ; Test for end of first string
    JNZ loop            ; If not zero, jump to 'loop'

end:
    JZ done             ; If the characters are equal, jump to 'done'
    SUB AL, BL          ; Subtract second byte from first
    MOVSX RAX, AL       ; Sign extend AL to RAX. MOVSX is used to preserve the sign
    RET                 ; Return comparison result

done:
    XOR RAX, RAX        ; Set RAX to 0
    RET                 ; Return
