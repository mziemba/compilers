/*
 * Calculates the greatest common divisor for two numbers: a and b.
 *
 * Contains equivalent of the following code:
 *
 *     if (b > a) {
 *         int t = a;
 *         a = b;
 *         b = t;
 *     }
 *     while (b != 0) {
 *         int t = a % b;
 *         a = b;
 *         b = t;
 *     }
 *     return a;
 */
.data
a: .long 12
b: .long 8
fmt: .string "a=%d, b=%d, gcd=%d\n"
.text
.globl main

main:
    push %ebp
    mov %esp, %ebp

    mov a, %edi
    mov b, %esi
    call calculate_gcd

    push %eax
    push b
    push a
    push $fmt
    call printf

    mov $0, %eax
    leave
    ret

calculate_gcd:
    /* a -> edi, b -> esi */
    cmp %esi, %edi
    jl while_cond
    mov %edi, %ecx
    mov %esi, %edi
    mov %ecx, %esi
while_cond:
    cmp $0, %esi
    je after_while
    mov %edi, %eax
    mov %esi, %ebx
    xor %edx, %edx
    div %ebx
    /* edx = a mod b */
    mov %esi, %edi
    mov %edx, %esi
    jmp while_cond
after_while:
    mov %edi, %eax
    ret
