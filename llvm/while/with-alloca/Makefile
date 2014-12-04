all: while-with-alloca

clean:
	rm -f *.o *.bc while-with-alloca

while-with-alloca: while-with-alloca-exec.o
	gcc -o $@ $^

while-with-alloca-exec.o: while-with-alloca-exec.bc
	llc -filetype=obj -o $@ $^

while-with-alloca-exec.bc: while-with-alloca.bc
	llvm-link -o $@ $^ ../../lib/runtime.bc

while-with-alloca.bc: while-with-alloca.ll
	llvm-as -o $@ $^
