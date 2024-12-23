#this program take an input x10 as the nth bit number of x5 and toggle the bit
li x5, -1#number to be toggled
li x6, 1#tmp reg
li x10,0#bit number to be toggled
sll x6, x6, x10
xor x6,x5,x6