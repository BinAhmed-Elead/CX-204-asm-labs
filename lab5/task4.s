.data

.text
main:
    li a0, 4 # N
    call factorial
    mv s0, a0
    #exit(0)
    li a1,0 #exit code
    exit_main:
    li a0,10
    ecall
    
factorial:#arg(a0=N), return(a0=Result)
    #initial
    addi sp, sp, -12
    sw ra, 0(sp)
    # base case ####### \
    li t0, 1 # cond     #
    bgt a0, t0, skip    #
    li a0, 1            #
    j return            #
    ################### /
    skip:
    mv t2, a0 # sum = N ; initialy
    sw a0, 4(sp)
    sw t2, 8(sp)
    addi a0, a0,-1# N-1
    call factorial
    lw t2, 8(sp)
    mul t2, a0, t2 # accumilate N * factorial(N-1)
    lw a0, 4(sp)
    mv a0, t2 # a0 = accumilated sum
    return:
    lw ra, 0(sp)
    addi sp, sp,12
    ret