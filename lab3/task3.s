.data
    array1: .byte 1 2 3 4
    array2: .word 0 0 0
.text

    la x5, array1
    

    lb x7, 3(x5)
    sw x7, 12(x5)
    
    lb x7, 2(x5)
    sw x7, 8(x5)
    
    lb x7, 1(x5)
    sw x7, 4(x5)
    
    lb x7, 0(x5)
    sw x7, 0(x5)