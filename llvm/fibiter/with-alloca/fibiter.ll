declare void @printInt(i32) ;  in another module

define i32 @fibIter(i32 %n) {
    entry:
        %a = alloca i32
        %b = alloca i32
        %c = alloca i32
        %counter = alloca i32
        store i32 1, i32* %a
        store i32 1, i32* %b
        store i32 1, i32* %counter
        br label %for_cond

    for_cond:
        %w1 = load i32* %counter
        %w2 = icmp slt i32 %w1, %n
        br i1 %w2, label %for_body, label %for_end

    for_body:
        ; c = b
        %w3 = load i32* %b
        store i32 %w3, i32* %c
        ; b += a
        %w4 = load i32* %a
        %w5 = add i32 %w3, %w4
        store i32 %w5, i32* %b
        ; a = c
        store i32 %w3, i32* %a

        ; increase counter
        %w6 = load i32* %counter
        %w7 = add i32 1, %w6
        store i32 %w7, i32* %counter
        
        br label %for_cond

    for_end:
        %res = load i32* %b
        ret i32 %res
}

define i32 @main() {
    %res = call i32 @fibIter(i32 6)
    call void @printInt(i32 %res)
    ret i32 0
}
