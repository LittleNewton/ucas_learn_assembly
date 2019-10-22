# 软件安装

``` bash
$ nasm -v

valid output formats for -f are (`*' denotes default):
  * bin       flat-form binary files (e.g. DOS .COM, .SYS)
    ith       Intel hex
    srec      Motorola S-records
    aout      Linux a.out object files
    aoutb     NetBSD/FreeBSD a.out object files
    coff      COFF (i386) object files (e.g. DJGPP for DOS)
    elf32     ELF32 (i386) object files (e.g. Linux)
    elf64     ELF64 (x86_64) object files (e.g. Linux)
    elfx32    ELFX32 (x86_64) object files (e.g. Linux)
    as86      Linux as86 (bin86 version 0.3) object files
    obj       MS-DOS 16-bit/32-bit OMF object files
    win32     Microsoft Win32 (i386) object files
    win64     Microsoft Win64 (x86-64) object files
    rdf       Relocatable Dynamic Object File Format v2.0
    ieee      IEEE-695 (LADsoft variant) object file format
    macho32   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (i386) object files
    macho64   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (x86_64) object files
    dbg       Trace of all info passed to output stage
    elf       ELF (short name for ELF32)
    macho     MACHO (short name for MACHO32)
    win       WIN (short name for WIN32)
```

1. 安装了 gcc 和 g++ 工具

``` bash
sudo apt install gcc-multilib g++-multilib nasm
```

如果 asm 源代码为 `src/Source.asm`，那么编译命令如下

```
nasm -f elf32 -o build/Source.o src/Source.asm
ld -e _main -m elf_i386 -o build/Source build/Source.o
```

特别地，如果是 64 位的源代码，需要如下命令

```
nasm -f elf64 -o build/Source.o src/Source.asm
#  👇 -e 指的应该是 Entry，把 _main 作为程序的入口
ld -e _main -m elf_x86_64 -o build/Source build/Source.o
```
