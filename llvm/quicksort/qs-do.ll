declare i32 @choose_pivot(i32, i32) ;  in another module
declare void @swap(i32*, i32, i32) ;  in another module

; // Should contain the equivalent of the following code: 
;   int key, i, j, k;
;   if (m < n) {
;      k = choose_pivot(m, n);
;      swap(A, m, k);
;      key = A[m];
;      i = m + 1;
;      j = n;
;      while (i <= j)
;      {
;         while ((i <= n) && (A[i] <= key))
;                i++;
;         while((j >= m) && (A[j] > key))
;                j--;
;         if (i < j)
;                swap(A, i, j);
;      }
;      swap(A, m, j);
;      quicksort(A, m, j-1);
;      quicksort(A, j+1, n);
;   }
define void @quicksort(i32* %A, i32 %m, i32 %n) {
    entry:
        ; if (m < n)
        %cond1 = icmp slt i32 %m, %n
        br i1 %cond1, label %if_true, label %return

    if_true:
        ; k = choose_pivot(m, n);
        %k = call i32 @choose_pivot(i32 %m, i32 %n)
        ; swap(A, m, k);
        call void @swap(i32* %A, i32 %m, i32 %k)
        ; key = A[m];
        %w1 = getelementptr i32* %A, i32 %m
        %key = load i32* %w1
        ; i = m + 1;
        %i = add i32 %m, 1
        ; j = n;
        %j = add i32 %n, 0
        br label %while_cond

    while_cond:
        ; while (i <= j)
        %i.4 = phi i32 [%i, %if_true], [%i.2, %inner_if_end]
        %j.4 = phi i32 [%j, %if_true], [%j.2, %inner_if_end]
        %cond2 = icmp sle i32 %i.4, %j.4
        br i1 %cond2, label %while_body, label %while_end

    while_body:
        br label %inner_while_1_cond

    inner_while_1_cond:
        ; while ((i <= n) && (A[i] <= key))
        %i.2 = phi i32 [%i.4, %while_body], [%i.3, %inner_while_1_body]
        %cond3 = icmp sle i32 %i, %n
        br i1 %cond3, label %lazy_if_1, label %inner_while_1_end

    lazy_if_1:
        ; (A[i] <= key)
        %w4 = getelementptr i32* %A, i32 %i.2
        %w5 = load i32* %w4
        %cond4 = icmp sle i32 %w5, %key
        br i1 %cond4, label %inner_while_1_body, label %inner_while_1_end

    inner_while_1_body:
        ; i++;
        %i.3 = add i32 %i.2, 1
        br label %inner_while_1_cond

    inner_while_1_end:
        br label %inner_while_2_cond

    inner_while_2_cond:
        ; while ((j >= m) && (A[j] > key))
        %j.2 = phi i32 [%j.4, %inner_while_1_end], [%j.3, %inner_while_2_body]
        %cond5 = icmp sge i32 %j.2, %m
        br i1 %cond5, label %lazy_if_2, label %inner_while_2_end

    lazy_if_2:
        ; (A[j] > key)
        %w6 = getelementptr i32* %A, i32 %j.2
        %w7 = load i32* %w6
        %cond6 = icmp sgt i32 %w7, %key
        br i1 %cond6, label %inner_while_2_body, label %inner_while_2_end

    inner_while_2_body:
        ; j--;
        %j.3 = sub i32 %j.2, 1
        br label %inner_while_2_cond

    inner_while_2_end:
        ; if (i < j)
        %cond7 = icmp slt i32 %i.2, %j.2
        br i1 %cond7, label %inner_if_true, label %inner_if_false

    inner_if_true:
        ; swap(A, i, j);
        call void @swap(i32* %A, i32 %i.2, i32 %j.2)
        br label %inner_if_end

    inner_if_false:
        br label %inner_if_end

    inner_if_end:
        br label %while_cond

    while_end:
        ; swap(A, m, j);
        call void @swap(i32* %A, i32 %m, i32 %j.4)
        %w2 = sub i32 %j.4, 1
        %w3 = add i32 %j.4, 1
        ; quicksort(A, m, j-1);
        call void @quicksort(i32* %A, i32 %m, i32 %w2)
        ; quicksort(A, j+1, n);
        call void @quicksort(i32* %A, i32 %w3, i32 %n)
        br label %return

    return:
        ret void
}
