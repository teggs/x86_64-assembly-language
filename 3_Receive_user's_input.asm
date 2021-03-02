section .data ;see Appendix, Three Sections of x84_64 Assembly File
  text1 db "Input your name: "
  len1 equ $- text1 ;len1 should be calculated first then text2 should be defined. Otherwise len1 will equal to len1 + len2.
  text2 db "Hello, "
  len2 equ $- text2

section .bss      
  name resb 16  ;reserve 16 bytes for user's input.

section .text
  global _start
  
_start:                      
  call _printText1
  call _getName
  call _printText2
  call _printName
  
  mov rax, 60
  mov rdi, 0
  syscall
  
_printText1:                            
  mov rax, 1
  mov rdi, 1
  mov rsi, text1
  mov rdx, len1
  syscall
  ret
  
_getName: ;this part invoke the sys_write function. So its parameters are different from other 3 parts.
  mov rax, 0
  mov rdi, 0
  mov rsi, name
  mov rdx, 16
  syscall
  ret
  
_printText2:
  mov rax, 1
  mov rdi, 1
  mov rsi, text2
  mov rdx, len2
  syscall
  ret
  
_printName:
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, 16
  syscall
  ret


;Appendix: Three Sections of x84_64 Assembly File
; .data section
;data section is where all data are defined before compilation.

; .bss section
;bss section is where data are allocated for future use.

; .text section
;text section is where the actual code goes.
