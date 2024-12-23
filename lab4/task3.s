.data
    vec1: .byte 1 2 3 4 5 6 7 8
    vec2: .byte 9 10 11 12 13 14 15 16
    result: .word 0 0 0 0 0 0 0 0
.text
main:
    la x5, vec1
    la x6, vec2
    la x7, result
    
    mv x8, x5
    mv x9, x6
    mv x14, x7
    
    li x12, 0 # i = 0
    li x13, 8 # stop cond
    loop:
    bge x12, x13, exit_loop
    lb x10, 0(x8)
    lb x11, 0(x9)
    add x15 ,x10,x11
    sw x15, 0(x14)
    addi x8,x8,1
    addi x9,x9,1
    addi x14,x14,4
    addi x12,x12,1
    j loop
    exit_loop:
    
    exit:
    li a1, 0
    li a0, 10
    ecall