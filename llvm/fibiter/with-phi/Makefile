all: fibiter2

clean:
	rm -f *.o *.bc fibiter2

fibiter2: fibiter2-exec.o
	gcc -o $@ $^

fibiter2-exec.o: fibiter2-exec.bc
	llc -filetype=obj -o $@ $^

fibiter2-exec.bc: fibiter2.bc
	llvm-link -o $@ $^ ../../lib/runtime.bc

fibiter2.bc: fibiter2.ll
	llvm-as -o $@ $^
