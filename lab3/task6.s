.data
    array_size: .byte 7 # n-1
    shift_amount: .byte 2 # n
    array: .byte 0x78, 0x56, 0x34, 0x12, 0x21, 0x43, 0x65, 0x87
.text
    la x5, array
    la x6, array_size
    lb x6, 0(x6)
    la x8, shift_amount
    lb x8, 0(x8)
    
    li x9, 0
    
    add x7, x5, x6 # x7 is the last address of the array
    add x9, x7, x8 # x9 is the new last address of the array
    loop:
    blt x7, x5, exit_loop # if x7 is equal to base address it means we finished
    lb x10, 0(x7)
    sb x10, 0(x9)
    addi x7, x7, -1
    addi x9, x9, -1
    j loop
    exit_loop:
    mv x7, x5
    li x9, 0
    loop_fill_zeros:
    sb x0, 0(x7)
    addi x7, x7, 1
    addi x9, x9, 1
    bne x9, x8 ,loop_fill_zeros # loop (shift_amount) times 
    exit:
    li a1, 0
    li a0, 10
    ecall