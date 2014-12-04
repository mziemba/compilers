int fibiter(int n) {
    int a = 1;
    int b = 1;
    for (int i = 0; i < n; i++) {
        int c = b;
        b += a;
        a = c;
    }
    return b;
}

int main() {
    int val = fibiter(6);
    return 0;
}
