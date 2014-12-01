/*
 * Calculates n-th Fibonacci number (iterative method).
 *
 * Contains equivalent of the following code:
 *
 *     int fib_iter(int n) {
 *         int a = 1;
 *         int b = 1;
 *         for (int i = 1; i < n; i++) {
 *             int t = a;
 *             a = b;
 *             b += t;
 *         }
 *         return b;
 *     }
 */
.data
    n: .long 8
    fmt: .string "n=%d, fib=%d\n"

.text
    .globl main

main:
    push %ebp
    movl %esp, %ebp

    movl n, %edi
    call fib_iter

    push %eax
    push n
    push $fmt
    call printf

    movl $0, %eax
    leave
    ret

fib_iter:
    /* a -> ecx, b -> eax, i -> esi, n -> edi */
    movl $1, %ecx
    movl %ecx, %eax
    movl %eax, %esi
    jmp for_cond
for_body:
    addl %eax, %ecx
    xchgl %eax, %ecx
    inc %esi
for_cond:
    cmp %edi, %esi
    jl for_body
after_for:
    ret
