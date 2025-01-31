.data
    prompt1: .asciiz "Enter integer N (2 <= N <= 1000): "
    prompt2: .asciiz "Enter integer M (2 <= M <= 1000): "
    space: .asciiz " "
    newline: .asciiz "\n"
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
	
	move 	$a1, $v0
	move 	$a0, $s0
	jal findPrimesInRange
	
	li $v0, 10
	syscall


   isPrime:
    li $t0, 2 
    li $v0, 1
    loop_check:
        mult $t0, $t0
        mflo $t1
        bgt $t1, $a0, end_loop_check
        div $a0, $t0
        mfhi $t2
        beq $t2, $0, not_prime_check
        addi $t0, $t0, 1
        j loop_check
    not_prime_check:
        li $v0, 0
    end_loop_check:
        jr $ra
        
   readInt:
	li 	$v0, 5		
	syscall
	jr 	$ra
	
    printInt:
	li $v0, 1
	syscall
	jr $ra
	
	
    findPrimesInRange:
    	move $t7, $ra
        move $s0, $a0
        move $s1, $a1
        move $k0, $s0
    loop_prime: 
        bgt $k0, $s1, end_range 
        move $a0, $k0 
        jal isPrime
        beq $v0, $zero, not_prime_print
        move $a0, $k0
        jal printInt
        li $v0, 4    
        la $a0, space
        syscall
        not_prime_print:
        addi $k0, $k0, 1
        j loop_prime
    end_range:
        li $v0, 4
        la $a0, newline
        syscall
        jr $t7
