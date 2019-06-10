global _start
%include "macro.inc"
%include "lib.inc"

section .data
in_fd: dq 0

%define pc r15
%define w r14
%define rstack r13

section.text

%incclude "words.inc"

section .bss

resq 511
rstackStr: resq 1

inputBuf: resb 1024
dictData: req 65536

userMem: resq 65536

state: resq 1

section .data
lastWord: dq _lw
curWord: dictData
memPtr: dq userMem

section .rodata
word_not_exist_msg: "word doesn't exist\n", 0 

section .text
next:
 mov w, pc
 add pc, 8
 mov w, [w]
 jmp [w]

_start:
 jmp i_init
