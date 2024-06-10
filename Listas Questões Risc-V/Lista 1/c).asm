_start:
#Definir valores iniciais
	lw x21, x
	addi x22, x0, 1
	addi x23, x0, 2
	addi x24, x0, 3
	addi x25, x0, 0x2d
ler:
#Definir número do loop para armazenar o valor corretamente
	addi x31, x31, 1

#Ler valores
	lb x5, 1025(x0)
	lb x6, 1025(x0)
	lb x7, 1025(x0)

#Ajustar dezena lida	
	addi x6, x6, -48
	slli x8, x6, 3
	slli x9, x6, 1
	add x6, x8, x9
#Ajustar unidade lida 
	addi x7, x7, -48

#Definir que valores ajustados serão armazenados onde
	beq x31, x22, sA
	beq x31, x23, sB
	beq x31, x24, sC

#Caso tenha problema, vai imprimir o valor de x21
	bge x0, x0, end

#Armazenar valores ajustados em A, B e C
sA:
	beq x5, x25, negA
	bge x0, x0, posA
negA:
	sub x18, x0, x6
	sub x18, x18, x7
	bge x0, x0, ler
posA:
	add x18, x6, x7
	bge x0, x0, ler
sB:
	beq x5, x25, negB
	bge x0, x0, posB
negB:
	sub x19, x0, x6
	sub x19, x19, x7
	bge x0, x0, ler
posB:
	add x19, x6, x7
	bge x0, x0, ler
sC:
	beq x5, x25, negC
	bge x0, x0, posC
negC:
	sub x20, x0, x6
	sub x20, x20, x7
	bge x0, x0, oCond
posC:
	add x20, x6, x7
	bge x0, x0, oCond

#Começo das condições
oCond:
#Definir valores para as condições
	addi x28, x0, 5
	addi x29, x0, 66
	addi x30, x0, 16

#Primeira condição
	bge x18, x28, fCond
	bge x0, x0, end
fCond:
#Segunda condição
	blt x19, x29, sCond
	bge x0, x0, end
sCond:
#Terceira condição
	bge x20, x30, tCond
	bge x0, x0, end
tCond:
#Se todas as condições forem verdadeiras, vai ajustar o valor de x21
	add x21, x21, x22
	bge x0, x0, end
end:
#Imprimir valor de x21	
	sb x21, 1024(x0)
    halt
x: .word 48