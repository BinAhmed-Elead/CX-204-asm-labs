.data
    str: .asciiz "abcdefg"
    str_len: .byte 7
    
.text
    la x5, str
    
    la x6, str_len
    lb x6, 0(x6)
    addi x6, x6, -1
    add x7, x5, x6
    
   # first address is in x5 and last address in x7:: now we swap
   loop:
   lb x8, 0(x5)
   lb x9, 0(x7)
   #swap x8 and x9
   sb x9, 0(x5)
   sb x8, 0(x7)
   addi x7, x7, -1
   addi x5, x5, 1
   bge x7, x5, loop
   exit:
   li a1,0
   li a0,10
   ecall