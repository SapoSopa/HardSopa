# basicamente a estrutura das portas é:
# 11 10
#  3  9
#  5  6
# vai ler a temperatura no A0

_start:
	add x10, x0, x0 # limpa oque tiver
	sb x10, 1030(x0) # coloca para ler o A0

_loop:
	lh x10, 1031(x0) # pega o 0-1023 de leitura

        # primeira condição 0-15
	addi x11, x0, 3
	addi x12, x0, 327
	blt x10, x12, _print

        # 16-20
	addi x11, x0, 5
	addi x12, x0, 429
	blt x10, x12, _print

        # 21-25
	addi x11, x0, 6
	addi x12, x0, 531
	blt x10, x12, _print

        # 26-30
	addi x11, x0, 9
	addi x12, x0, 634
	blt x10, x12, _print

        # 31-35
	addi x11, x0, 10
	addi x12, x0, 736
	blt x10, x12, _print

        # se for maior que 35 ele passa e printa
	addi x11, x0, 11

_print:
        # apaga o led
	sw  x11, 1033(x0)
	add x30, x0, x0
        # acende na maxima
	sw x30, 1034(x0)
	addi x30, x0, 255
	sw x30, 1034(x0)
        # apaga denovo
	add x30, x0, x0
	sw x30, 1034(x0)
        # volta no loop
	beq x0, x0, _loop


# O tempo de execução de uma iteração do loop depende do valor pela quantidade de blt que ele vai passar
# mas fica quase um cpi de 86/28; O clock deveria ser 10x menor e nao é possível implementar com minha solução
