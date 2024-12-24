.data
    array: .word 1,2,3,4,5,6,7,8,9

.text
main:
    la a0, array
    li a1, 9 # array_size
    jal ra ,sumArray
    mv s0, a0 # save the sum
    
    #exit(0)
    li a1,0 #exit code
    exit_main:
    li a0,10
    ecall
    
sumArray:#arg(a0=ArrayPointer,a1=ArraySize), return(a0=sum)
    li t0, 0 #sum=0
    li t1, 0 #i=0
    loop:
    bge t1, a1, exit_loop # if !(i < size) break
    slli t2, t1, 2 # i * 4 = offset
    add t2, t2, a0 # base + offset
    lw t3, 0(t2) # t3 = array[i]
    add t0, t0, t3
    #inc
    addi t1, t1, 1 # i++
    j loop
    exit_loop:
    mv a0, t0
    jalr x0, ra, 0