# erase all built-in rules
.SUFFIXES:

.PHONY: all clean

ASM32=nasm -f elf32
ASM32_FLAGS=
ASM64=nasm -f elf64
ASM64_FLAGS=
ASM_FLAGS=-g -F stabs
LD=ld
LD_FLAGS=

all: \
    HelloWorld.32.exe

clean:
	rm -fv *.o *.exe

%.32.o: %.32.asm
	$(ASM32) $(ASM_FLAGS) $(ASM32_FLAGS) -o $@ $<

%.64.o: %.64.asm
	$(ASM64) $(ASM_FLAGS) $(ASM64_FLAGS) -o $@ $<

%.exe: %.o
	$(LD) $(LD_FLAGS) -o $@ $^

HelloWorld.32.o: HelloWorld.32.asm
HelloWorld.32.exe: HelloWorld.32.o
