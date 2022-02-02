#include<stdio.h>

extern unsigned long long int program();

int main() {
  unsigned long long int ret = program();
  printf("program returned: %llu\n", ret);
}
	 
