global _start
%include "macro_lib.inc"
%include "lib.inc"

section .data
in_fd: dq 0

%define pc r15
%define w r14
%define rstack r13

section .text

%include "words.inc"

section .bss

resq 1023
rstackStr: resq 1

inputBuf: resb 1024
dictData: resq 65536

userMem: resq 65536

state: resq 1

section .data
lastWord: dq _lw
curWord: dq dictData
memPtr: dq userMem

section .rodata
word_not_exist_msg: db  "word doesn't exist\n", 0 

section .text
next:
 mov w, pc
 add pc, 8
 mov w, [w]
 jmp [w]

_start:
 jmp i_init
