nasm -f elf64 file.asm
#create an object file called file.o
#elf64 create an object executable in x86_64 system. elf32 works in x86 system.

ld -s -o file file.o
#ld, the GUN linker, creates an executable file for WSL.
