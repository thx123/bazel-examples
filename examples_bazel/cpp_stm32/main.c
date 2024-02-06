// The simplest possible main function
#include <stdio.h>
#include "functions.h"

int main() {
    int result = add(3, 5);
    printf("Result: %d\n", result);
    return 0;
}

extern void _start()
{
    main();
}
