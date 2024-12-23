# this program exams if x5 is greater than x6 it if it is then it will set x10

li x5, 20
li x6, -10
sub x10,x5,x6
# if the x6 is larger then substraction would lead to the result begin negtive whitch is endicated by the msb 1=negtive 0=postive or zero
srli x10,x10,31