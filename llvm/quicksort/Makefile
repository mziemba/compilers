all: qs.exe

clean:
	rm -f *.o *.bc qs.exe

qs.exe: qs-main.o qs-do.o
	gcc -o $@ $^

qs-main.o: qs-main.c
	gcc -c -o $@ $^

qs-do.o: qs-do.bc
	llc -filetype=obj -o $@ $^

qs-do.bc: qs-do.ll
	llvm-as -o $@ $^

