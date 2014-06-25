# erase all built-in rules
.SUFFIXES:

.PHONY: all clean

ASM32=nasm -f elf32
ASM32_FLAGS=
ASM64=nasm -f elf64
ASM64_FLAGS=
ASM_FLAGS=-g -F stabs
LD32=ld --oformat elf32-i386
LD32_FLAGS=
LD64=ld --oformat elf64-x86-64
LD64_FLAGS=
LD_FLAGS=

all: \
    HelloWorld.32.exe

clean:
	rm -fv *.o *.exe

%.32.o: %.32.asm
	$(ASM32) $(ASM_FLAGS) $(ASM32_FLAGS) -o $@ $<

%.64.o: %.64.asm
	$(ASM64) $(ASM_FLAGS) $(ASM64_FLAGS) -o $@ $<

%.32.exe: %.32.o
	$(LD32) $(LD_FLAGS) $(LD32_FLAGS) -o $@ $^

%.64.exe: %.64.o
	$(LD64) $(LD_FLAGS) $(LD64_FLAGS) -o $@ $^

HelloWorld.32.o: HelloWorld.32.asm
HelloWorld.32.exe: HelloWorld.32.o
