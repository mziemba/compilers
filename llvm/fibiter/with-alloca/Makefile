all: fibiter

clean:
	rm -f *.o *.bc fibiter

fibiter: fibiter-exec.o
	gcc -o $@ $^

fibiter-exec.o: fibiter-exec.bc
	llc -filetype=obj -o $@ $^

fibiter-exec.bc: fibiter.bc
	llvm-link -o $@ $^ ../../lib/runtime.bc

fibiter.bc: fibiter.ll
	llvm-as -o $@ $^
