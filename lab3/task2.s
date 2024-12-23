.data
    var: .word 0x12345678
.text
    la x5, var
#     mv x9, x5
#     li x8, 4
#     li x6, 0
# loop:
#     lb x7, 0(x9)
#     slli x6, x6 ,8
#     add x6, x6, x7
#     addi x8, x8, -1
#     addi x9, x9, 1
#    bne x8, x0, loop
#    sw x6, 0(x5)
   lb x6, 0(x5)
   lb x7, 3(x5)
   sb x7, 0(x5)
   sb x6, 3(x5)
   
   lb x6, 1(x5)
   lb x7, 2(x5)
   sb x7, 1(x5)
   sb x6, 2(x5)
    