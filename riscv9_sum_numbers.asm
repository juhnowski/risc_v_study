# Ввести целое число (возможно, отрицательное) и посчитать сумму его цифр в десятичной записи; вывести как целое.
.data
	end:	.word	0xa 
	max:	.word	0xb	# максимальная длина 11 символов
	input:	.asciz	"\n"             

.text
# ввели число
	la	a0	input	# addres input buffer
	la	a1	max	# maximum number of character
	li	a7	8	# чтение строки
	ecall
	mv  	a0 	zero	# аккумулятор суммы
  	la	t0	input	# Счётчик
  	la 	t2	end
fill:	sb      t1 (t0)         # Запись числа по адресу в t0
        addi    t0 t0 -1         # Увеличим адрес на размер слова в байтах
        blt    	t1 t2 finish 	# Дошли до конца
        addi	t3 t1 -0x30
        add	a0 a0 t3	
        b	fill
finish:        
        li      a7 1
        ecall
	li	a7 	10		# завершаем программу
	ecall