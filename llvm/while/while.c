int main() {
    int a = 5;
    int b = 0;
    while (a != 0) {
        if (a < 0) {
            b = 1;
        } else {
            b = -1;
        }
        a = a + b;
    }
    return a;
}
