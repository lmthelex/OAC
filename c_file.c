#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern float asmMediaArm(float *v, int N);
float cMediaArm(float *v, int N);
float calcRelErr(float ref, float cal);

int main(){
    float arr[5] = {1, 2, 3, 4, 5}, resAsm;

    resAsm = asmMediaArm(arr,5);

    printf("La mediana hallada en ASM es: %.2f\n", resAsm);
    return 0;
}
