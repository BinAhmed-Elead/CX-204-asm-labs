.data
    a: .word 5
    b: .word 6
    result: .word 0
    astrik: .asciiz " * "
    equal_sign: .asciiz " = "
    end: .asciiz "\n"
.text
main:
    la x5, a
    la x6, b
    la x7, result
    lw x5, 0(x5)
    lw x6, 0(x6)
    lw x7, 0(x7)
    loop:
    ble x6, x0, exit_loop
    andi x8, x6, 1
    beq x8,x0,skip
        add x7, x7, x5
    skip:
    slli x5,x5,1
    srli x6, x6,1
    j loop
    exit_loop:
    
    #print a
    la a1, a
    lw a1, 0(a1)
    li a0, 1
    ecall
    #print *
    la a1, astrik
    li a0, 4
    ecall
    #print b
    la a1, b
    lw a1, 0(a1)
    li a0, 1
    ecall
    #print =
    la a1, equal_sign
    li a0, 4
    ecall
    #print result
    mv a1, x7
    li a0, 1
    ecall
    #print new line
    la a1, end
    li a0, 4
    ecall
    exit:
    li a1,0
    li a0,10
    ecall