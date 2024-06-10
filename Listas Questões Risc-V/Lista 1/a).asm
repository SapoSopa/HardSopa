_start:
#Armazenar as variáveis "a", "b" e "c"
	lw x5, a
	lw x6, b
	lw x7, c
#Armazenar os valores de comparação do if
	addi x28, x0, 5
	addi x29, x0, 66
	addi x30, x0, 16

#Começo do if 
	bge x5, x28, fCond
	bge x0, x0, final
fCond:
	blt x6, x29, sCond 
	bge x0, x0, final
sCond:
	bge	x7, x30, tCond
	bge x0, x0, final
#Final do if se deu tudo verdade
tCond:
	addi x9, x0, 1
	sw x9, x
#Final do if se pelo menos um falso
final:
	lw x9, x
#Encerrar
	halt

#Modifique os valores de "a", "b" e "c"
#5 casos que dão certo:
#	a=5, b=5, c=16;
#	a=6, b=6, c=20;
#	a=7, b=9, c=30;
#	a=40, b=30, c=16;
#	a=5, b=65, c=16;
#5 casos que não dão certo:
#	a=4, b=65, c=16;
#	a=5, b=66, c=16;
#	a=7, b=4, c=2;
#	a=4, b=66, c=14;
#	a=10, b=10, c=20;
a: .word 1 
b: .word 1 
c: .word 1
x: .word 0
