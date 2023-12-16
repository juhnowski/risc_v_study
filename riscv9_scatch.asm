.data
end:	.word	0xa 	# символ конца строки
max:	.word	0xb	# максимальная длина 11 символов
negat:  .word 	0x2d	# отрицательное число
start:	.word   0x0a

.text
# ввели число
	la	a0	start	# addres input buffer
	la	a1	max	# maximum number of character
	li	a7	8	# чтение строки
	ecall
	
	la  	s0 start
	lbu	t1 end
	lb	t2 negat
	lb 	t0 (s0)
	bne 	t0 t2 pos
	li	a0 3
	b loop
pos:	
	li	a0 0
loop:	lbu 	t0 (s0)
	beq	t0 t1 finish
	addi	t0 t0 -0x30
	add	a0 a0 t0
	addi 	s0 s0 1
	b loop
finish:	
        li      a7 1
        ecall
	li	a7 	10		# завершаем программу
	ecall