global asmMediaArm

section .text

asmMediaArm:
    mov eax, 0
    cvtsi2ss xmm1, eax
    mov r8, rsi
    dec r8
    mov r9, rsi
    cvtsi2ss xmm0, r9d

    loop:
        cmp rsi, 0
        je final
        mov eax, 1
        cvtsi2ss xmm2, eax
        divss xmm2, [rdi + 4*r8]
        addss xmm1, xmm2
        dec rsi
        dec r8
        jmp loop 

    

    final:
    divss xmm0, xmm1 
        ret