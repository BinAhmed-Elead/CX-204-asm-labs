# this program will take a byte number in x6 and store 
# the byte from x5 into x10 with signed extention
li x5, 0x1234f678
li x6, 1 # byte number (0-3)

slli x6,x6,3 # x6 times eight to convert the byte number to number of shifts right to get the nth byte

srl x10, x5, x6

slli x10, x10, 24
srai x10, x10, 24