.data
in_n:   .asciz "Input N:\n"
in_num: .asciz "Input numbers:\n"
array:	.word 0x0

.text
	la      a0 	in_n      # Выведем строку
        li      a7 	4
        ecall
        
# Ввести N
	li	a7	5
	ecall
	mv 	s0 a0
	mv	s1 a0
# N раз ввести числа
	la      a0 	in_num      # Выведем строку
        li      a7 	4
        ecall

        la      t0 array	# указатель на массив
	mv	s1 s0
	sw      a0 (t0)         # Запись числа по адресу в t0
	li	s2 1		# Счетчик недубликатов
	li	a7 5
loop:	ecall
# записываем если такого числа нет
        addi    t0 t0 4         # Увеличим адрес на размер слова в байтах
	
	addi	s1 s1 -1
	bgt  	s1 zero loop
	
	li      a7 11
        li      a0 10
        ecall  
        
	la      t0 array
	mv 	s1 s0	
out:   	li      a7 1
    	lw      a0 (t0)         # Выведем очередной элемент массива
        ecall
                
        addi    t0 t0 4
	addi	s1 s1 -1

	li      a7 11
        li      a0 10
        ecall   
	bgt 	s1 zero out        
        
	li      a7 11
        li      a0 10
        ecall  


	  
finish:	
	li      a7 1
	ecall
	li	a7 	10		# завершаем программу
	ecall									
	
