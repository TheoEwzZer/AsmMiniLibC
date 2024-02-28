;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strncmp

strncmp:
    XOR RAX, RAX        ; Zero out RAX
    MOV RCX, RDX        ; Copy count to RCX.
    CMP RCX, 0          ; Compare count to zero
    JZ end_zero         ; If zero, jump to 'end_zero'

loop:
    TEST RCX, RCX       ; Test count
    JZ  end             ; If zero, jump to 'end'
    MOV AL, BYTE [RDI]  ; Load byte from first string
    MOV BL, BYTE [RSI]  ; Load byte from second string
    CMP AL, BL          ; Compare bytes
    JNE end             ; If not equal, jump to 'end'
    INC RDI             ; Move to next byte in first string
    INC RSI             ; Move to next byte in second string
    DEC RCX             ; Decrease count
    TEST AL, AL         ; Test for end of string
    JNZ loop            ; If not zero, jump to 'loop'

end:
    SUB AL, BL          ; Subtract second byte from first
    MOVSX RAX, AL       ; Sign extend AL to RAX. MOVSX is used to preserve the sign of the result
    RET                 ; Return comparison result

end_zero:
    XOR RAX, RAX        ; Zero out RAX
    RET                 ; Return 0
