#include <kdefines.h>

#include <stdio.h>


int main(void)
{
    printf("Hello, World!\n");

#ifdef KPLATFORM_LINUX
    printf("On Linux!\n");
#endif

#ifdef KPLATFORM_WINDOWS
    printf("On Windows!\n");
#endif
    return 0;
}
