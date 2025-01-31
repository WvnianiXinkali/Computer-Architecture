.data
    key: .asciiz  "PgEfTYaWGHjDAmxQqFLRpCJBownyUKZXkbvzIdshurMilNSVOtec#@_!=.+-*/"
    orig: .asciiz "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    s1: .space 100001
    ans: .space 100001 
    Q: .word 0
    newline: .asciiz "\n"
    wrongchar: .asciiz "Wrong char."
    mp: .space 256
.text
.globl main
main:
    la $s0, key  
    la $s1, orig 
    la $s2, s1   
    la $s3, ans  

init_map_loop:
    lb $t2, 0($s0)
    lb $t3, 0($s1)
    sb $t3, mp($t2)
    addi $s0, $s0, 1
    addi $s1, $s1, 1
    bnez $t3, init_map_loop

    li $v0, 5     
    syscall
    move $t4, $v0

    li $v0, 8
    la $a0, s1
    li $a1, 100000
    syscall
     
    
    la $s0, key  
    la $s1, orig 

    beq $t4, 1, encrypt
    j decrypt

encrypt:
    lb $t6, 0($s2)
    li $t7, 10
    beq $t6, $t7, end_transform
    blt $t6, 'a', digit_transform
    bgt $t6, 'z', digit_transform
    sub $t6, $t6, 'a'
    add $t6, $t6, $s0 
    lb $t6, 0($t6)
    sb $t6, 0($s3)
    addi $s2, $s2, 1
    addi $s3, $s3, 1
    j encrypt

digit_transform:
    lb $t6, 0($s2)
    li $t7, 10
    beq $t6, $t7, end_transform 
    blt $t6, '0', uppercase_char 
    bgt $t6, '9', uppercase_char
    sub $t6, $t6, '0'
    addi $t6, $t6, 52
    add $t6, $t6, $s0 
    lb $t6, 0($t6)
    sb $t6, 0($s3) 
    addi $s2, $s2, 1 
    addi $s3, $s3, 1 
    j encrypt

uppercase_char:
    lb $t6, 0($s2)
    li $t7, 10
    beq $t6, $t7, end_transform 
    blt $t6, 'A', wrong_char 
    bgt $t6, 'Z', wrong_char 
    sub $t6, $t6, 'A'
    addi $t6, $t6, 26
    add $t6, $t6, $s0 
    lb $t6, 0($t6)
    sb $t6, 0($s3) 
    addi $s2, $s2, 1 
    addi $s3, $s3, 1 
    j encrypt

decrypt:
    lb $t6, 0($s2)
    beq $t6, 0, end_transform
    lb $t6, mp($t6)
    sb $t6, 0($s3)
    addi $s2, $s2, 1
    addi $s3, $s3, 1
    j decrypt

end_transform:
    sb $zero, 0($s3)

    li $v0, 4
    la $a0, ans
    syscall

    li $v0, 4  
    la $a0, newline
    syscall

    li $v0, 10
    syscall
    
wrong_char:

    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 4
    la $a0, wrongchar
    syscall
    
    li $v0, 10
    syscall
