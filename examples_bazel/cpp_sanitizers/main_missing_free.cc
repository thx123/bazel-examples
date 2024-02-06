#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

 
int main(int argc, const char *argv[]) {
    char *s = static_cast<char*>(malloc(100));
    strcpy(s, "Hello world!");
    printf("string is: %s\n", s);
    return 0;
}
