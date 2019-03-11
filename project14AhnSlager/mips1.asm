# file:  MIPS-1.asm
# author: Kevin Ahn, Kyle Slager
# date: March. 8, 2019
# This program reads in integers until a negative integer is entered.
# It then outputs the sum of the positive integers.


    .text       # the code segment of the program
    .globl main # the starting point of the program
    
main:   
    li $t0, 0   # initialize the sum to 0
    li $v0 5
    syscall
    bltz $v0 endloop
    

multiply:
	
    

endloop: 
    move $a0, $t0
    li $v0, 1
    syscall     # output the value in $a0
    li $v0, 10
    syscall     # exit