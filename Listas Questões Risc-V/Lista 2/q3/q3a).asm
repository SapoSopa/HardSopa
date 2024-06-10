_start:
        lw x10, a
        lw x11, b
        add x30, x0, x0 # resultado;
        add x31, x0, x0 # contador;
	lw x12, l # tamanho de bits;
        
aux_loop:
        andi x6, x10, 1 # pega o bit menos significativo; 
        beq x6, x0, multi # se for zero nao faz nada;
        add x30, x30, x11 # se for 1 ele soma ;
multi:
        slli x11, x11, 1 # o de cima desloca para esquerda para ir somando deslocado;
        srli x10, x10, 1 # desloca para direita para ir pegando os bits menos significativos;
        addi x31, x31, 1 # soma o contador de tamanho;
	blt x31, x12, aux_loop

a: .word 0xe
b: .word 0xf
l: .word 0x12

# 99.999(1869F) * 99.999 -> 9.999.800.001(25408D6C1)
# O resultado nao cabe nos registradores do riscv, fica um digito faltando, se for fazer o maximo;
# O tempo de execucao no cycle-acurate foi por volta de 4.74s com 470 ciclos de clock aproximadamente;
