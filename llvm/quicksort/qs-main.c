#include <stdio.h>
#include <stdlib.h>

extern int quicksort(int * A, int m, int n);

extern void swap(int * A, int x, int y) {
    int temp = A[x];
    A[x] = A[y];
    A[y] = temp;
}

extern int choose_pivot(int i, int j ) {
    return ((i + j) / 2);
}

int main(int argc, char * argv[]) {
    int num, i;
    int * a;
    i = scanf("%d", &num);
    if (i <= 0 || num <= 0) {
        fprintf(stderr, "The number of array elements must be positive!\n");
        return 1;
    }
    a = (int *)malloc(sizeof(int) * num);
    if (a == NULL) {
        fprintf(stderr, "Out of memory!\n");
        return 1;
    }
    for (i = 0; i < num; ++i) {
        int tmp = scanf("%d", &(a[i]));
        if (tmp <= 0) {
            free(a);
            fprintf(stderr, "Error reading number %d!\n", i + 1);
            return 1;
        }
    }
    quicksort(a, 0, num - 1);
    printf("RESULT:\n");
    for (i = 0; i < num - 1; ++i) {
        printf("%d ", a[i]);
    }
    printf("%d\n", a[num - 1]);
    free(a);
    return 0;
}

