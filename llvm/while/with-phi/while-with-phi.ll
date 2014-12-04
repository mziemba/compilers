declare void @printInt(i32) ;  in another module

define i32 @main() {
    entry:
        %a.1 = add i32 5, 0
        %b.1 = add i32 0, 0
        br label %while_cond

    while_cond:
        %a.2 = phi i32 [%a.1, %entry], [%a.6, %if_end]
        %c1 = icmp ne i32 %a.2, 0
        br i1 %c1, label %while_body, label %while_end 

    while_body:
        %c2 = icmp slt i32 %a.2, 0
        br i1 %c2, label %if_true, label %if_false

    if_true:
        %b.4 = add i32 1, 0
        br label %if_end

    if_false:
        %b.5 = add i32 -1, 0
        br label %if_end

    if_end:
        %b.6 = phi i32 [%b.4, %if_true], [%b.5, %if_false]
        %w5 = add i32 %a.2, %b.6
        %a.6 = add i32 %w5, 0
        br label %while_cond

    while_end:
        %res = add i32 %a.2, 0
        call void @printInt(i32 %res)
        ret i32 0
}
