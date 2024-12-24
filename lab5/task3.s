.data
    array: .word 3,2,4,1,0
.text
main:
    la a0, array # ArrayPointer
    li a1, 5 # ArraySize
    call bubbleSort
    
    #exit(0)
    li a1,0 #exit code
    exit_main:
    li a0,10
    ecall
    
bubbleSort:#arg(a0=ArrayPointer,a1=ArraySize), return(array should be sorted in memory)
    #initial
    li t0, 0 # i=0
    addi a1, a1,-1 # since all the cond checking is using n-1
    mv t6, a0
    loop:
    bge t0, a1, exit_loop 
        li t1, 0 # j=0
        loop2:
        bge t1, a1, exit_loop2 
            lw t2, 0(t6) # array[j]
            lw t3, 4(t6) # array[j+1]
            ble t2, t3, skip
            sw t2 , 4(t6)
            sw t3 , 0(t6)
        skip:
        slli t5, t1, 2 # j * 4 = offset
        add t6, t5, a0 # base + offset
        #inc j
        addi t1, t1, 1 # j++
        j loop2
        exit_loop2:
    #inc i
    addi t0, t0, 1 # i++
    j loop
    exit_loop:
    mv a0, t0
    ret