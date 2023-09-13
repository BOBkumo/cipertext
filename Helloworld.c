#include <stdio.h>

int main() {
    int a = 5;
    int b = 10;

    int c = 0;
    c = a;
    a = b;
    b = c;

    printf("a = %d \n b = %d", a, b);
}