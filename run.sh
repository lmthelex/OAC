#!/bin/sh
nasm -f elf64 my_file.asm -o my_file.o
ld my_file.o -o my_file
./my_file
