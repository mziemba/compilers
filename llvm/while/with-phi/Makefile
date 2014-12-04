all: while-with-phi

clean:
	rm -f *.o *.bc while-with-phi

while-with-phi: while-with-phi-exec.o
	gcc -o $@ $^

while-with-phi-exec.o: while-with-phi-exec.bc
	llc -filetype=obj -o $@ $^

while-with-phi-exec.bc: while-with-phi.bc
	llvm-link -o $@ $^ ../../lib/runtime.bc

while-with-phi.bc: while-with-phi.ll
	llvm-as -o $@ $^
