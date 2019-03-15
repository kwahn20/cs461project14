# file:  MIPS-3.asm
# author: Kevin Ahn, Kyle Slager, Danqing Zhou
# date: March. 8, 2019
# This program reads in integers until -999 is entered.
# It then outputs the numbers in reverse order

	.data 
		separator: .asciiz " " # used to add in a space in the output
 	.text       # the code segment of the program
	.globl main # the starting point of the program

main:   
	li $t0, -999 # loads in the -999 into $t0
	addi $sp, $sp, -4 # pushes onto the stack
	sw $t0, 0($sp) # stores the contents of the stack
    
loop:
	li $v0, 5 
	syscall
	beq $v0, -999, endloop # breaks to endloop if value was -999
 	addi $sp, $sp, -4 # pushes the new value onto the stack
	sw $v0, 0($sp)
	b loop # jumps back to the top of this procedure 
	
endloop:
 	lw $a0, 0($sp) 
	addi $sp, $sp, 4 # pops the stack
	beq $a0, -999, quit # if the user has entered -999 it breaks to the quit call 
	li $v0, 1			
 	
 	syscall # prints the value to line
	la $a0, separator # spacing
	li $v0, 4
	
	syscall
	b endloop # goes back to top of end loop

quit:
	li $v0, 10 
	syscall     # quit