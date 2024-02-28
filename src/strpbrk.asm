;
; EPITECH PROJECT, 2024
; MinilibC
; File description:
; Going deeper into the rabbit hole
;

BITS 64
SECTION .text
GLOBAL  strpbrk

strpbrk:
    MOV RDX, RDI                ; Save first string pointer in RDX
    MOV RBX, RSI                ; Save second string pointer in RBX

outer_loop:
    MOV AL, BYTE [RDX]          ; Load byte from first string
    TEST AL, AL                 ; Check if end of first string
    JE  not_found               ; If it is, jump to 'not_found'
    MOV RDI, RBX                ; Copy second string pointer to RDI

inner_loop:
    MOV AH, BYTE [RDI]          ; Load byte from second string
    TEST AH, AH                 ; Check if end of second string
    JE  next_char               ; If it is, jump to 'next_char'
    CMP AL, AH                  ; Compare bytes
    JE  found                   ; If equal, jump to 'found'
    INC RDI                     ; Move to next position in second string
    JMP inner_loop              ; Continue search in second string

next_char:
    INC RDX                     ; Move to next position in first string
    JMP outer_loop              ; Continue search in first string

found:
    MOV RAX, RDX                ; Copy pointer to found char to RAX
    RET                         ; Return pointer to found char

not_found:
    XOR RAX, RAX                ; Zero out RAX
    RET                         ; Return NULL, no char found
