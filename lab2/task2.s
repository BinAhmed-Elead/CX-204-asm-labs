.data
    constant: .word 0x12345677
    str1: .asciiz "Odd\n"
    str2: .asciiz "Even\n"
.text
li x5 0xFFFFFFFF
not x5,x5

#load constant
la x5, constant
lw x5, 0(x5)

#test odd or even
andi t1, x5, 1
# if last bit is 1 it is even else it is odd

li a0, 4#print string
beq t1, x0, Even
#print odd
la a1, str1
ecall
j exit_Even
Even:
#print even
la a1, str2
ecall
exit_Even:


#print int
mv a1, x5#value to print
li a0, 1#print int
ecall

#exit
li a1, 0 #exit code
li a0, 10#exit 
ecall