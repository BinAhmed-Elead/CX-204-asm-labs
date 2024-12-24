.data

.text
main:
    li a0, 5
    call factorial
    mv s0, a0 # save the result
    
    #exit(0)
    li a1,0 #exit code
    exit_main:
    li a0,10
    ecall
    
factorial:#arg(a0=n), return(a0=result)
    li t0,1 # result=1
    #initial
    li t1, 1 # i=1
    loop:
    bgt t1, a0, exit_loop 
    mul t0, t0, t1
    
    #inc
    addi t1, t1, 1 # i++
    j loop
    exit_loop:
    mv a0, t0
    ret