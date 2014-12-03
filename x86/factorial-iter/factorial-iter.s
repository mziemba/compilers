.data
    fmt:        .string "%d\n"
    err_msg:    .string "Exactly one parameter is required\n"

.text
    .globl  main
    .type   main, @function

main:
    pushl   %ebp                # save old base pointer
    movl    %esp, %ebp
    pushl   %ebx                # save registers

    cmpl    $2, %edi            # verify that there is exactly one parameter
    jne     error

    movl    4(%esi), %eax       # get first parameter
    pushl   %eax
    call    atoi
    movl    %eax, %ebx

    movl    $1, %eax            # result = 1
    movl    $1, %ecx            # i = 1

loop_cond:
    cmp     %ebx, %ecx          # while (i <= n)
    jg      after_loop
    imul    %ecx                # result *= i
    inc     %ecx                # i++
    jmp     loop_cond

after_loop:
    push    %eax                # print result
    push    $fmt
    call    printf

    movl    $0, %eax
    jmp     end

error:
    pushl   $err_msg            # print error message
    call    printf
    jmp     end
    
end:
    pop     %ebx                # restore registers
    leave                       # restore old base pointer
    ret
