    .text       # the code segment of the program
    .globl main # the starting point of the program
    
main:   
    li $t0, 0   # initialize the sum to 0
    li $v0 5
    syscall
    move $t4, $v0
    li $v0 5
    syscall
    move $t3, $v0
loop:   
    bge $t2, $t3, endloop
    addi $t2, $t2, 1
    add $t0, $t0, $t4
    b loop
    
endloop: 
    move $a0, $t0
    li $v0, 1
    syscall     # output the value in $a0
    li $v0, 10
    syscall     # exit
 
