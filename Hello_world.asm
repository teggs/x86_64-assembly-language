section .data   
  text db "Hello, world!",0xa ;0xa equals 10, stands for '\n'.
  len equ $- text
  
section .text           
  global _start:  ;start stands for main in c/c++, unchangeable.
_start:  
  mov rax, 1      
  mov rdi, 1       
  mov rsi, text     
  mov rdx, len
  syscall ;see the Appendix, System Call List
  
  mov rax, 60   
  mov rdi, 0
  syscall
  
  COMMENT @
  Appendix: System Call List
  syscall    ID(rax) ARG1(rdi)       ARG2(rsi)  ARG3(rdx)  ARG4(r10)
  sys_read     0     file descriptor buffer     count
  sys_write    1     file descriptor buffer     count
  sys_open     2     file name       flag       mode
  sys_close    3     file descriptor
  sys_exit     60    error code
  
  file descriptor: 0(standard input), 1(standard output), 2(standard error)
  buffer: location of the string
  count: length of the string
  
  Therefore, if one wants to output a string. He needs to invoke sys_write, that is,
  rax = 1, rdi = 1, rsi = text, rdx = len
  This is the same reason for sys_exit.
  @
