.data
    arr: .word
.text
main:
    la x5, arr
    mv x8, x5
    li x7, 0
    li x6, 100
    loop:
    bge x7, x6, exit_loop
    sw x7, 0(x8)
    addi x8, x8, 4
    addi x7, x7, 1
    j loop
    exit_loop:
    exit:
    li a1, 0
    li a0, 10
    ecall