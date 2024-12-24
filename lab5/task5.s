.data

.text
main:
    li a0, 14 # N
    call fibonacci
    mv s0, a0
    #exit(0)
    li a1,0 #exit code
    exit_main:
    li a0,10
    ecall
    
fibonacci:#arg(a0=N), return(a0=Result)
    #initial
    addi sp, sp, -12
    sw ra, 0(sp)
    # base case ####### \
    li t0, 1 # cond     #
    bgt a0, t0, skip    #
    # a0 = a0           #
    j return            #
    ################### /
    skip:
    # fibonacci(N-1)####
    addi a0, a0, -1 # N-1
    sw a0, 4(sp)
    call fibonacci
    ####################
    #save the result of fibonacci(N-1)
    mv t1, a0
    lw a0, 4(sp) #restoring a0 to N-1
    sw t1, 8(sp) # save t1
    # fibonacci(N-2)####
    addi a0, a0, -1 # N-2 ; N-1-1 = N-2
    sw a0 ,4(sp)
    call fibonacci
    ####################
    #save the result of fibonacci(N-2)
    mv t2, a0
    lw t1, 8(sp) # restore t1
    # now add both values
    add a0, t1, t2
    return:
    lw ra, 0(sp)
    addi sp, sp,12
    ret