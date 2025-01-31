.data
    prompt1: .asciiz "Enter integer N (1 <= N <= 100): "
    prompt2: .asciiz "Enter integer M (1 <= M <= 100): "
    error: .asciiz "All array elements must be between 1 and M.\n"
    space: .asciiz " "
    newline: .asciiz "\n"
    arrayel: .asciiz "A_"
    colen: .asciiz ": "
.text

    main:
    	li $v0, 4
    	la $a0, prompt1
    	syscall


	jal readInt
	move 	$s0, $v0
	
	li $v0, 4
    	la $a0, prompt2
    	syscall
    	
    	jal readInt
    	
    	move $t3, $v0
    	
    	li $v0, 4
    	la $a0, error
    	syscall
    	
    	li $t4, 100
    	sub $sp, $sp, $t4
	
	move 	$a0, $s0
	move 	$a1, $t3
	jal readAllBytes
	
	jal printAllBytes
	
	add $sp, $sp, $t4
	
	li $v0, 10
	syscall
	
    readInt:
	li 	$v0, 5		
	syscall
	jr 	$ra

    readAllBytes:
       move $t7, $ra
       move $t5, $a0
       li $a2, 0
       loop:
    	   beq $a2, $t5, ret_addr
    	   li $v0, 4
    	   la $a0, arrayel
    	   syscall
    	   move $a0, $a2
    	   jal printInt
    	   li $v0, 4
    	   la $a0, colen
    	   syscall
    	   jal readInt
    	   add $t0, $sp, $v0
    	   lb $t1, ($t0)
    	   addi $t1, $t1, 1
    	   sb $t1, ($t0)
    	   addi $a2, $a2, 1
    	   j loop
       ret_addr:
       	  jr $t7
       	  
    printAllBytes:
    	move $t7, $ra
    	move $t5, $a1
    	li $a2, 1
    	loopp:
    	    bgt $a2, $t5, ret_addrp
    	    add $t0, $sp, $a2
    	    move $a0, $a2
    	    jal printInt
    	    li $v0, 4
    	    la $a0, colen
    	    syscall
    	    lb $t1, ($t0)
    	    move $a0, $t1
    	    jal printInt
	    li $v0, 4
    	    la $a0, newline
    	    syscall
    	    addi $a2, $a2, 1 
    	    j loopp  
    	ret_addrp:
    	   jr $t7
    
    
    printInt:
	li $v0, 1
	syscall
	jr $ra

