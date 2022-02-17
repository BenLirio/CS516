#include <stdio.h>

long long int factorial(long long int n) {
  long long int acc = 1;
  while (n > 0) {
    acc = acc * n;
    n = n - 1;
  }
  return acc;
}

int main(int argc, char *argv[]) {
  printf("factorial(6) = %llu\n", factorial(6));
}
