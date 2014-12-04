declare void @printInt(i32) ;  in another module

define i32 @fibiter2(i32 %n) {
	entry:
		%a.1 = add i32 1, 0
		%b.1 = add i32 1, 0
		%i.1 = add i32 1, 0
		br label %for_cond

	for_cond:
		%i.2 = phi i32 [%i.1, %entry], [%i.3, %for_body]
		%a.2 = phi i32 [%a.1, %entry], [%a.3, %for_body]
		%b.2 = phi i32 [%b.1, %entry], [%b.3, %for_body]
		%res.2 = icmp slt i32 %i.2, %n
		br i1 %res.2, label %for_body, label %for_end

	for_body:
		%c.3 = add i32 %b.2, 0
		%b.3 = add i32 %b.2, %a.2
		%a.3 = add i32 %c.3, 0
		%i.3 = add i32 %i.2, 1
		br label %for_cond

	for_end:
		ret i32 %b.2
}

define i32 @main() {
	%res = call i32 @fibiter2(i32 7)
	call void @printInt(i32 %res)
	ret i32 0
}

