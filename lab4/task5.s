.data
    white_space: .asciiz " "
    astrik: .asciiz "*"
    new_line: .asciiz "\n"
.text
main:
    li x5,6
    li x7,0
    loop:
        beq x5, x0, exit_loop
        mv x6,x5
        inner_loop1:
        beq x6, x0, exit_inner_loop1
        la a1, white_space
        li a0, 4
        ecall
        addi x6, x6, -1
        j inner_loop1
        exit_inner_loop1:
        
        li x6, 0 # it is zero regardless
        slli x8, x7, 1
        addi x8,x8,1
        inner_loop2:
        la a1, astrik
        li a0, 4
        ecall
        addi x6, x6, 1
        blt x6,x8 inner_loop2
        exit_inner_loop2:
        addi x5,x5,-1
        la a1, new_line
        li a0, 4
        ecall
        addi x7, x7, 1
    j loop
    exit_loop:
    exit:
    li a1,0
    li a0,10
    ecall