#include <stdio.h>

int factorial(int n) {
  if (n == 0) {
    return 1;
  }
  return n * (factorial(n-1));
}

int main(int argc, char *argv[]) {
  printf("factorial(6) = %d\n", factorial(6));
}
