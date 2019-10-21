do:
	nasm -f elf32 -o hello_world.o hello_world.asm
	ld -m elf_i386 -o hello_world hello_world.o

.PHONY: test
test:
	nasm -f elf32 -o test.o test.asm
	ld -m elf_i386 -o test test.o

.PHONY: add_sum
add_sum:
	nasm -f elf32 -o add_sum.o add_sum.asm
	ld -m elf_i386 -o add_sum add_sum.o