li x5, 10
li x6, 4
sub x10,x5,x6
# if the x6 is larger then substraction would lead to the result begin negtive whitch is endicated by the msb 1=negtive 0=postive or zero
srli x10,x10,31
# set x10 if x6 is larger than x5

bne x10, x0, skip # if x10 is zero it means x5 is maximum and x6 is minimum
#swap x6 and x5
mv x7, x6
mv x6, x5
mv x5, x7
skip:
# here we have the x5 as the minimum and x6 as the maximum

and x7, x6, x5
xor x28, x6, x5