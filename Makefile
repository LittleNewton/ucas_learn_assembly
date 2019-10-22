clean:
	rm -fr build
	mkdir build
do:
	nasm -f elf32 -o build/hello_world.o src/hello_world.asm
	ld -m elf_i386 -o build/hello_world build/hello_world.o

.PHONY: test
test:
	nasm -f elf32 -o build/test.o src/test.asm
	#  👇 -e 指的应该是 Entry，把 _main 作为程序的入口
	ld -e _main -m elf_i386 -o build/test build/test.o

.PHONY: add_sum
add_sum:
	nasm -f elf32 -o build/add_sum.o src/add_sum.asm
	ld -m elf_i386 -o build/add_sum build/add_sum.o

# wihle_loop 是一个 64 位的程序，所需编译命令为 x86_64
.PHONY: while_loop
while_loop:
	nasm -f elf64 -o build/while_loop.o src/while_loop.asm
	#  👇 -e 指的应该是 Entry，把 _main 作为程序的入口
	ld -e _main -m elf_x86_64 -o build/while_loop build/while_loop.o

