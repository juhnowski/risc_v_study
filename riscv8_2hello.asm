.data
	sep:    .asciz  "Hello\n"
.text
	li 	t0 	0
	li	s1	2	 	# количество повторений
	la      a0 	sep          	# Выведем строку
        li      a7 	4
loop:	addi	t0	t0	1
        ecall
        blt     	t0 	s1 	loop