# вводит натуральное число N, 
# а затем — N (возможно, отрицательных) целых чисел, 
# после чего выводит (в строку) N самых левых десятичных цифр этих чисел. 
# Для вычисления одной цифры написать функцию left, которая в a0 получает число, и там же возвращает цифру.
# Тест
# 5                             
# -2345
# 7345623
# -4321
# 2 
# 7543
# Результат
# 27427

.data
promp_N:	.asciz 	"Input N"
promp_NN:	.asciz	"Input N numbers"
promp_Res:	.asciz	"Left numbers"
negat:  .word 	0x2d	# отрицательное число
max:	.word	8	# максимальная длина 8 символов
start:	.word   0x0a	# начало массива

.text
	lb	s0 negat
	
	la	a0 promp_N
	jal	print

	li	a7 5
	ecall
	mv	s1 a0	# s1 = N
	
	la	a0 promp_NN
	jal	print

	# цикл по вводу 
	mv	s2 s1	# цикл по s2
	la	a0 start	# addres input buffer
	lw	a1 max	# maximum number of character
	li	a7 8	# чтение строки
loop:	ecall
	add	a0 a0 a1
	addi	s2 s2 -1
	bne 	s2 zero	loop
inp_end:	
	# цикл по вызову left для всех строк

        la	a0 promp_Res
	jal	print
	
	mv	s2 s1	# цикл по s2
        la	s3 start
l_loop: mv	a0 s3
	jal     left
	
	li      a7 11
        ecall
	
	add	s3 s3 a1
	addi	s2 s2 -1
	bne 	s2 zero	l_loop

	li	a7 	10		# завершаем программу
	ecall	
	
	
	
# in/out a0
left: 	addi    sp sp -8       	## Выделяем две ячейки — под ra и s0
	sw	ra 4(sp)        ## Сохраняем ra
	sw	s0 (sp)		## Сохраняем s0		
	lb 	t1 (a0)
	bne 	s0 t1 pos
	addi 	a0 a0 1
pos:	lb	a0 (a0)
	lw      ra 4(sp)        # Восстанавливаем ra
	lw      s0 (sp)		# Восстанавливаем s0
        addi    sp sp 8         # Освобождаем две ячейки стека
	ret
# in a0	
print:	addi    sp sp -4       	## Выделяем ячейку — под ra 
	sw	ra (sp)         ## Сохраняем ra
	li	a7 4		# Выведем приглашение
	ecall
	li      a7 11           # Выведем перевод строки
        li      a0 10
        ecall
        lw      ra (sp)		# Восстанавливаем ra
        addi    sp sp 4         # Освобождаем ячейку стека
	ret
