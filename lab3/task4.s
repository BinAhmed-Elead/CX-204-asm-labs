.data
    str: .asciiz "abcdefg"
    str_len: .byte 7
.text

    la x5, str
    la x6, str_len
    lb x6, 0(x6)
    mv x7, x5
    
    li x9, 32
    not x9,x9

    loop:
    lb x8, 0(x7)
    and x8, x8, x9
    sb x8, 0(x7)
    addi x7,x7,1
    addi x6, x6, -1
    bne x6, x0, loop
    
 exit:
    li a1, 0
    li a0, 10
    ecall
    