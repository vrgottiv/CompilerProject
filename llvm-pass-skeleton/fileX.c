#include <stdio.h>

int c;

void fun(int a) {
  printf("Value of a is %d\n", a);
}

int main() {
  void (*fun_ptr)(int) = &fun;
  (*fun_ptr)(10);

  int b;
  for (c = 0; c < 3; c++) {
    b = c + 1;
  }

  return c;
}
