nasm -f elf64 asm_file.asm -o asm_file.o
gcc c_file.c asm_file.o -o exe_file
./exe_file
rm asm_file.o
rm exe_file