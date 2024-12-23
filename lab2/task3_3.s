# this program will set x10 if there is odd number of ones in x5
li x5, 0x3
mv x6, x5
li x10,0
li x9, 31
loop:
andi x7, x6, 1
xor x10, x7,x10
addi x9, x9, -1
srli x6, x6, 1
bne x9, x0, loop
exit: