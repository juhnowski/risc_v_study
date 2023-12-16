# Написать полную программу, которая вводит два натуральных числа и выводит их наибольший общий делитель. 
# Для вычисления НОД написать рекурсивную функцию nod, которая принимает два числа в a0 и a1 и возвращает значение в a0.
# 2467080
# 49360080
# while a != b:
#    if a > b:
#        a = a - b
#    else:
#        b = b - a
# 
# print(a)
.data
a:	.word	2467080
b:	.word	49360080

.text
	lw	a0 a
	lw	a1 b
	addi	a2 zero -1
	jal	nod
	li	a7 1		# Выведем приглашение
	ecall
	li	a7 	10		# завершаем программу
	ecall
	
nod:	addi    sp sp -4       	## Выделяем ячейку — под ra 
	sw	ra (sp)         ## Сохраняем ra
	beq 	a0 a1 end
	bgt 	a1 a0 else
	mul 	t1 a1 a2
	add	a0 a0 t1
	jal	nod
	b	end
else:		 
	mul	t1 a0 a2
	add	a1 a1 t1
	jal	nod
end:	lw      ra (sp)		# Восстанавливаем ra
        addi    sp sp 4         # Освобождаем ячейку стека
	ret		
	
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