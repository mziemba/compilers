declare void @printInt(i32) ;  in another module

define i32 @fib(i32 %n) {
	entry:
		%cond = icmp sle i32 %n, 1
		br i1 %cond, label %if_true, label %if_false
	if_true:
		ret i32 1
	if_false:
		%w1 = sub i32 %n, 1
		%w2 = sub i32 %n, 2
		%w3 = call i32 @fib(i32 %w1)
		%w4 = call i32 @fib(i32 %w2)
		%w5 = add i32 %w3, %w4
		ret i32 %w5
}

define i32 @main() {
	%i1 = add i32 6, 0
	%res = call i32 @fib(i32 7)
	call void @printInt(i32 %res)
	ret i32 0
}

