.data
a:	.float -1.23
b:	.float -1.234

.text
	flw	f1 a t0
	flw	f2 b t0
	flt.s	t0 f1 f2 
	fdiv.s	f3 f2 f1
	frflags t0