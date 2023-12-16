.data
yes:    .asciz  "Is a triangle\n"
no:     .asciz  "Not a triangle\n"
.text
        jal     input
        mv      s1 a0
        jal     input
        mv      s2 a0
        jal     input
                                # третья сторона уже в регистра a0
        mv      a1 s1           # первая сторона
        mv      a2 s2           # вторая сторона
        jal     check
        bltz    a0 true
        la      a0 no
        b       output
true:   la      a0 yes
output: li      a7 4
        ecall
        li      a7 10
        ecall
.data
prompt: .ascii  "Enter triangle side: "
.text
input:  la      a0 prompt
        li      a7 4
        ecall
        li      a7 5
        ecall
        ret
check:  add     t0 a1 a2
        sub     t0 a0 t0
        add     t1 a2 a0
        sub     t1 a1 t1
        add     t2 a1 a0
        sub     t2 a2 t2
        and     a0 t0 t1
        and     a0 a0 t2
done:   ret