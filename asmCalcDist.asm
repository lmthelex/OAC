    global asmCalcDist
    section .text

asmCalcDist:
; void asmCalcDist(double *v1, double *v2, int N) 
; v1 -> rdi , v2 -> rsi, N -> rdx

    mov r8, 1
    movsd xmm0, [rdi] ; xmm0 = longi[0] <- long de Lima
    movsd xmm1, [rsi] ; xmm1 = lat[0]   <- lat de Lima
    ; (xmm0, xmm1) guarda la coordenada de Lima

    loop:
        cmp r8, rdx
        je final
        mov eax, 110
        cvtsi2sd xmm2, eax
        movsd xmm3, [rdi + 8*r8] ; xmm3 = long de la ciudad a evaluar
        movsd xmm4, [rsi + 8*r8] ; xmm4 = lat  de la ciudad a evaluar
        subsd xmm3, xmm0         ; xmm3 = diferencia de longitudes  
        subsd xmm4, xmm1         ; xmm4 = diferencia de latitudes
        mulsd xmm3, xmm3         ; xmm3 = (dif de long)²   
        mulsd xmm4, xmm4         ; xmm4 = (dif de lat)²        
        addsd xmm3, xmm4         ; xmm3 = (dif de long)² + (dif de lat)²       
        sqrtsd xmm4, xmm3        ; xmm4 = sqrt((dif de long)² + (dif de lat)²)        
        mulsd xmm4, xmm2         ; xmm4 = 110 * sqrt((dif de long)² + (dif de lat)²)

        inc r8     
        jmp loop
        

    final:
        ret
