/*
 * Calculates n-th Fibonacci number recursively.
 *
 * Contains equivalent of the following code:
 *
 *     int fib_rec(int n) {
 *         return n <= 1 ? 1 : fib_rec(n-1) + fib_rec(n-2);
 *     }
 */
.data
n: .long 6
fmt: .string "n=%d, fib=%d\n"
.text
.globl main

main:
    push %ebp
    mov %esp, %ebp

    mov n, %edi
    call fib_rec

    push %eax
    push n
    push $fmt
    call printf

    mov $0, %eax
    leave
    ret

fib_rec:
    cmp $1, %edi
    jg fib_rec_normal
    movl $1, %eax
    ret
fib_rec_normal:
    push %edi
    dec %edi
    call fib_rec
    pop %edi
    push %eax
    subl $2, %edi
    call fib_rec
    pop %edi
    addl %edi, %eax
    ret
