;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strcspn

strcspn:
    MOV RDX, RDI                ; Save first string pointer in RDX
    MOV RBX, RSI                ; Save second string pointer in RBX
    XOR RCX, RCX                ; Zero out RCX (counter)

outer_loop:
    MOV AL, BYTE [RDX]          ; Load byte from first string
    TEST AL, AL                 ; Check if end of first string
    JE  done                    ; If it is, jump to 'done'
    MOV RDI, RBX                ; Copy second string pointer to RDI

inner_loop:
    MOV AH, BYTE [RDI]          ; Load byte from second string
    TEST AH, AH                 ; Check if end of second string
    JE  next_char               ; If it is, jump to 'next_char'
    CMP AL, AH                  ; Compare bytes
    JE  done                    ; If equal, jump to 'done'
    INC RDI                     ; Move to next position in second string
    JMP inner_loop              ; Continue search in second string

next_char:
    INC RDX                     ; Move to next position in first string
    INC RCX                     ; Increment counter
    JMP outer_loop              ; Continue search in first string

done:
    MOV RAX, RCX                ; Copy counter to RAX
    RET                         ; Return counter
