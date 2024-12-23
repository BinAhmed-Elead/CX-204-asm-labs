.data
    var1: .word 0x12345678
    var2: .word 0x87654321
    result: .word 0x0
.text
    la x5, var1
    lw x5, 0(x5)
    
    la x6, var2
    lw x6, 0(x6)
    
    add x7, x5, x6
    la x8, result
    sw x7, 0(x8)