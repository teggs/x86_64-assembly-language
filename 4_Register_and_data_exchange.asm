;Preface
;1.Computer only uses 0/1 for calculation. Each 0/1 equals to one bit.
;  One byte equals to 8 bits. Therefore, a one-byte data may look like this: 11110000, which is denoted as 0xF0 for convenience.

;2.Registers in x86_64 system can store 64 bits, i.e. 8 bytes, i.e. 16 hexadecimal digits.
;  Take one of the register, rax, as an example. If we only want to move a one-byte data to rax, decimal digits work. For instance: mov rax, 48.
;  In this case, the values in this rax will be: 0xNNNNNNNNNNNNNN30, i.e. NNNNNNN0 in character, whereas N stands for none.
;  But if we want to move more than one bytes to rax, we must use hexadecimal digits. For instance: mov rax, 0x4241.
;  In this case, the values in this rax will be: 0xNNNNNNNNNNNN4241, i.e. NNNNNNBA in character.
;  Therefore, keep using hexadcimal numbers for moving data is a good habit.

;3.Registers take up 8 bytes, which means it will also occupy 8 contiguous addresses if you want to move the value in rax to one specific address.
;  However, in most of the time, we only need the lower bit value of rax. So we use other nouns to stand for these lower bits.
;  Let's use 1-8 to stands for each byte of the rax from lower bit to higher bit. In this case, al->1; ah->2; ax->1-2; eax->1-4 and rax->1-8. 
;  If we want to get the third or fifth byte in rax, we need to do the right shift operation first. Right shift 8 bits to get the third byte to al, for example.


;The following code shows how to rewrite '0000\n' to 'AB00\n' in the x86_64 system.
section .data
  digit db 48,48,48,48,0  ;which will print '0000\n'.
 
section .text
  global _start
_start:
  mov rax, 0x4241 ;the value in the rax right now is NNNNNNBA, whereas N stands for none.
  mov [digit], al ;change the first 0 to the al value i.e. A
  mov [digit+1], ah ;change the second 0 to the ah value i.e. B
  ;you can also use "mov[digit], ax" to replace the two previous lines, since ax takes up two addresses.
  
  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 5
  syscall
  
  mov rax, 60
  mov rdi, 0
  syscall
