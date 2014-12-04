all: fibrec

clean:
	rm -f *.o *.bc fibrec

fibrec: fibrec-exec.o
	gcc -o $@ $^

fibrec-exec.o: fibrec-exec.bc
	llc -filetype=obj -o $@ $^

fibrec-exec.bc: fibrec.bc
	llvm-link -o $@ $^ ../lib/runtime.bc

fibrec.bc: fibrec.ll
	llvm-as -o $@ $^
