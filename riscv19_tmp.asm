.data
negat:  .word 	0x2d	# отрицательное число
max:	.word	0xb	# максимальная длина 11 символов
start:	.word   0x0a	# начало массива
.text
	la	a0	start	# addres input buffer
	lw	a1	max	# maximum number of character
	li	a7	8	# чтение строки
	ecall
	
	lb	s0 negat
	
	lb 	t1 (a0)
	bne 	s0 t1 pos
	addi 	a0 a0 1
pos:	lb	a0 (a0)

	li      a7 11
        ecall
        li	a7 	10		# завершаем программу
	ecall