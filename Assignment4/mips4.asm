.data
    inp: .asciiz  "Input N: "
    ln10: .double 2.30258509299404590109361379290930926799774169921875
    eul: .double 2.7182818284590452354
    zer: .double 0
    threshold: .double 1.0
.text
.globl main
main:
    li $v0, 4
    la $a0, inp
    syscall
    
    li 	$v0, 5	
    syscall
    move $s0, $v0
    
    l.d $f0, zer
    l.d $f2, eul
    l.d $f26, ln10
    l.d $f14, threshold #1
    li $t0, 2
    
    loop_ans:
    	bgt $t0, $s0, end_all
    	l.d $f12, zer
    	
    	mtc1 $t0, $f16 # c
    	cvt.d.w $f16, $f16
    	
    	loop1:
    	  div.d $f16, $f16, $f2
    	  
    	  c.lt.d $f16, $f14
    	  
    	  bc1t end_loop1
    	  
    	  add.d $f12, $f12, $f14
    	  
    	  j loop1
    	end_loop1:
    	  mul.d $f4, $f16, $f2
    	  sub.d $f4, $f4, $f14
    	  div.d $f16, $f14, $f4
    	  
    	  add.d $f16, $f16, $f16
    	  add.d $f16, $f16, $f14
    	  
    	  mul.d $f18, $f16, $f16 # f
    	  
    	  l.d $f6, zer # b
    	  
    	  mov.d $f28, $f14 # d
    	  add.d $f20, $f14, $f14
    	  div.d $f16, $f16, $f20 
    	loop2:
	  mov.d $f8, $f6
	  mul.d $f10, $f28, $f16
	  div.d $f10, $f14, $f10
	  add.d $f6, $f6, $f10
	  c.eq.d $f6, $f8
	  bc1t end_loop2
	  
	  add.d $f28, $f28, $f20
	  mul.d $f16, $f16, $f18
	  
	  j loop2
	  
	end_loop2:
	
	  add.d $f6, $f6, $f12
	  
	  div.d $f6, $f6, $f26
	  
	  add.d $f0, $f0, $f6
    	
    	addi $t0, $t0, 1
    	
    	j loop_ans
    end_all:
    	cvt.w.d $f0, $f0
    	mfc1 $t1, $f0
    	addi $t1, $t1, 1
    	move $a0, $t1
    	li $v0, 1
	syscall
    li $v0, 10
    syscall