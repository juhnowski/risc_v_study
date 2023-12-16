.data
a:	.float	123.456
b:	.float	7.89e5
c:	.float	0.012
d:	.double 1234e123
.text
	flw 	 ft0 a t0
	flw	 ft3 b t1
	flw	 ft4 c t2
	fmv.x.s	 t1 ft0
	fmv.s.x	 ft2 t1
	fcvt.w.s t2 ft2
	fmadd.s	 ft5 ft4 ft3 ft0
	li	 a7 2
	fmv.s	 fa0 ft5
	ecall

	fld	ft0 d t0
	fadd.d	ft1 ft0 ft0
	li	a7 3
	fmv.d	fa0 ft1
	ecall