all: nwd

nwd: nwd.o ../lib/crti.o ../lib/crt1.o ../lib/crtn.o
	ld -s -o $@ -melf_i386 $^ -l:./../lib/libc.a

%.o: %.s
	gcc -c -o $@ -m32 $<

clean:
	rm -f nwd nwd.o *~
