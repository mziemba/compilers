declare void @printInt(i32) ;  in another module

define i32 @main() {
	entry:
		%a = alloca i32
		store i32 5, i32* %a
		%b = alloca i32
		store i32 0, i32* %b
		br label %while_cond

	while_cond:
        %w1 = load i32* %a
        %c1 = icmp ne i32 %w1, 0
        br i1 %c1, label %while_body, label %while_end 

    while_body:
        %w2 = load i32* %a
        %c2 = icmp slt i32 %w2, 0
        br i1 %c2, label %if_true, label %if_false

    if_true:
        store i32 1, i32* %b
        br label %if_end

    if_false:
        store i32 -1, i32* %b
        br label %if_end

    if_end:
        %w3 = load i32* %a
        %w4 = load i32* %b
        %w5 = add i32 %w3, %w4
        store i32 %w5, i32* %a
        br label %while_cond

    while_end:
        %res = load i32* %a
        call void @printInt(i32 %res)
        ret i32 0
}
