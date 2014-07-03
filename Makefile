# erase all built-in rules
.SUFFIXES:

.PHONY: all clean

all: \
    HelloWorld.x86-32.exe \
    HelloWorld.x86-64.exe \
    ExitCode.arm.exe

clean:
	rm -fv *.o *.exe

%.x86-32.o: %.x86-32.s
	i686-linux-gnu-as -o $@ $<

%.x86-32.exe: %.x86-32.o
	i686-linux-gnu-ld -o $@ $^


%.x86-64.o: %.x86-64.s
	x86_64-linux-gnu-as -o $@ $<

%.x86-64.exe: %.x86-64.o
	x86_64-linux-gnu-ld -o $@ $^


%.arm.o: %.arm.s
	arm-linux-elf-as -o $@ $<

%.arm.exe: %.arm.o
	arm-linux-elf-ld -o $@ $^


HelloWorld.x86-32.o: HelloWorld.x86-32.s
HelloWorld.x86-32.exe: HelloWorld.x86-32.o
HelloWorld.x86-64.o: HelloWorld.x86-64.s
HelloWorld.x86-64.exe: HelloWorld.x86-64.o
ExitCode.arm.o: ExitCode.arm.s
ExitCode.arm.exe: ExitCode.arm.o
