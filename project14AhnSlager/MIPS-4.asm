# file:  MIPS-3.asm
# author: Danqing Zhao, Kevin Ahn, Kyle Slager
# date: March. 14, 2019
# This program reads in integers until -999 is entered.
# It then outputs the numbers in reverse order using recursion

.data 
separator: .asciiz " " # used to add in a space in the output
.text       # the code segment of the program
.globl main # the starting point of the program

main:	
	jal rec # jump and links to the rec procedure
	li $v0, 10
	syscall
    
rec:
	li $v0, 5 
	syscall
	move $t2, $v0 		# moves value in v0 into t2
	
	addi $sp,$sp,-8         # adjust stack for 2 items
	sw   $ra,4($sp)         # save return address
	sw   $t2,0($sp)		# saves value in t2
	
	beq $v0, -999, end  	# breaks if the value entered is -999 to the end procedure
	jal rec			# recursive jump and link to itself
	
 	addi $sp, $sp, 8        # pops the new value off of the stack
        lw $a0, 0($sp)		
        li $v0, 1	
        syscall
        
        la $a0, separator       # spacing
	li $v0, 4
	syscall
	lw $ra,4($sp)		# loads the return address
        
        jr $ra			# jumps to the return address
        
end:
	jr $ra			# jumps to most recently saved return address
