nasm -g -f elf64 asm_file.asm -o asm_file.o
gcc -g asm_file.o c_file.c -o exe_file -lm
gdb
