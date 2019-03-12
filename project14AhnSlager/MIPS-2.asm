    .text       # the code segment of the program
    .globl main # the starting point of the program
    
main:   
    li $t0, 0   # initialize the sum to 0
    li $v0 5
    syscall
    move $a0, $v0
    li $v0 5
    syscall
    move $a1, $v0
    jal multiply
    move $a0, $v0
    li $v0, 1        # system call code for print_int
    syscall   
    li $v0, 10
    syscall     # exit
    
multiply: 
loop:   
    bge $t2, $a0, end
    addi $t2, $t2, 1
    add $t0, $t0, $a1
    b loop
 
 end:
    move $v0, $t0
    jr $ra
     
