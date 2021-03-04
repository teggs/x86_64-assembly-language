;Stack follows the LIFO (last in first out) rules.
;This code shows how stack works, which overwrites '00\n' by 'BA\n'.

section .data
  digit db 30,30,10
  
section .text
  global _start
_start:
  push 0x41 ;push character 'A' into an empty stack. The stack now stores 'A'.
  push 0x42 ;push character 'B' into the stack. The stack now stores 'AB'.
  push 0x43 ;push character 'C' into the stack. The stack now stores 'ABC'.
  
  pop rax ;give the last pushed value i.e. 'C' to the rax. The stack now stores 'AB'.
  pop rax ;give the last pushed value i.e. 'B' to the rax. The stack now stores 'A'.
  mov [digit], al ;replace the first '0' by the value i.e. 'B' in al. 
  ;The digit is 'B0\n' now.
  
  pop rax ;give the last pushed one i.e. 'A' to the rax. The stack is now empty again.
  mov [digit+1], al ;replace the second '0' by the value i.e. 'A' in al.
  ;The digit is 'BA\n' now.
  
  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 3
  syscall
  
  mov rax, 60
  mov rdi, 0
  syscall
