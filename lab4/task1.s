.data
    x: .word 5
    y: .word 4
    equal: .asciiz "Equal\n"
    not_equal: .asciiz "Not Equal\n"
.text
main:
    la x5, x
    la x6, y
    lw x5, 0(x5)
    lw x6, 0(x6)
    bne x5,x6, skip
    la a1, equal
    li a0, 4
    ecall
    j exit
    skip:
    la a1, not_equal
    li a0, 4
    ecall
    exit:
    li a1, 0
    li a0, 10
    ecall