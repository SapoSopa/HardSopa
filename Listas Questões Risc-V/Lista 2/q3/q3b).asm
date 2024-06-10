_start:
    addi x29, x0, 0x2d

    # basicamente a entrada é xxxxx-xxxxx
    # ele le e ja converte para a unidade correspondente
    # esses grandes blocos de codigo são para multiplicar, por 10, 100, 1k e 10k
    # tudo feito por composição de 2
    # a exemplo esse de 10k: (2^13+2^10+2^9+2^8+2^4) * X
ler:
    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 13
    add x10, x10, x21
    slli x21, x20, 10
    add x10, x10, x21
    slli x21, x20, 9
    add x10, x10, x21
    slli x21, x20, 8
    add x10, x10, x21
    slli x21, x20, 4
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 9
    add x10, x10, x21
    slli x21, x20, 8
    add x10, x10, x21
    slli x21, x20, 7
    add x10, x10, x21
    slli x21, x20, 6
    add x10, x10, x21
    slli x21, x20, 5
    add x10, x10, x21
    slli x21, x20, 3
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 6
    add x10, x10, x21
    slli x21, x20, 5
    add x10, x10, x21
    slli x21, x20, 2
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 3
    add x10, x10, x21
    slli x21, x20, 1
    add x10, x10, x21
    # as unidades é apenas converter de ascii
    lw x20, 1025(x0)
    addi x20, x20, -48
    add x10, x10, x20

    add x12, x0, x10
    # ler o separador
    lw x20, 1025(x0)
    add x10, x0, x0
    # mesma logica ler o segundo numero
    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 13
    add x10, x10, x21
    slli x21, x20, 10
    add x10, x10, x21
    slli x21, x20, 9
    add x10, x10, x21
    slli x21, x20, 8
    add x10, x10, x21
    slli x21, x20, 4
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 9
    add x10, x10, x21
    slli x21, x20, 8
    add x10, x10, x21
    slli x21, x20, 7
    add x10, x10, x21
    slli x21, x20, 6
    add x10, x10, x21
    slli x21, x20, 5
    add x10, x10, x21
    slli x21, x20, 3
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 6
    add x10, x10, x21
    slli x21, x20, 5
    add x10, x10, x21
    slli x21, x20, 2
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    slli x21, x20, 3
    add x10, x10, x21
    slli x21, x20, 1
    add x10, x10, x21

    lw x20, 1025(x0)
    addi x20, x20, -48
    add x10, x10, x20

    add x11, x0, x10		
    # o segundo numero ta em x12 e o primeiro em x11
    # a logica de multiplicação é a mesma da letra A
M_start:
    add x30, x0, x0
    add x31, x0, x0 
    lw x13, l

aux_loop:
    andi x6, x12, 1 
    beq x6, x0, multi 
    add x30, x30, x11 
multi:
    slli x11, x11, 1 
    srli x12, x12, 1 
    addi x31, x31, 1
    blt x31, x13, aux_loop
    # apenas um caracter para dar espaço para ver o resultado
    sw x0, 1024(x0)
    # terminada a multiplicao o resultado ta em x30
    # ai basicamente vamo separar os digitos por subtração de 10 basicamente
label1: 
    add x10, x0, x0
    add x11, x0, x0
    addi x12, x0, 10
    # se for um resultado menor que 10
    blt x30, x12, print_uni
label2:	
    # o loop para ficar somando 10 para extair a unidade do numero
    addi x10, x10, 1
    addi x11, x11, 10
    addi x12, x11, 10
    bge x30, x12, label2
print:
    # extrai a unidade do numero 
    # e volta para o loop mas o numero agora é a quantidade de 10 que foi usado
    # ou seja agora vai extrair as dezenas do numero original e assim por diante
    sub x30, x30, x11
    addi x30, x30, 0x30
    sw x30, 1024(x0)
    add x30, x0, x10
    blt x0, x30, label1
    # no final so printa as unidades
    # o print sai todo ao contrario mas da para entender
print_uni:
    addi x30, x30, 0x30
    sw x30, 1024(x0)

l: .word 0x12


# o tempo de execuçao vai depender do numero a ser printado
# a multiplicação tem um "fixo", por é um loop que vai rodar como se os numeros de entrada
# ambos tivessem 0x12 digitos, ou seja sempre o mesmo tamanho de loop
# ja o resultado para printar se ele for de apenas 1 digito ele é quase direto
# testei para ele imprimir 11500 e foi bem mais que 50s(parei no meio, mais de 50k ciclos então)
# então o tempo depende do resultado visto a demora de printar dessa forma
