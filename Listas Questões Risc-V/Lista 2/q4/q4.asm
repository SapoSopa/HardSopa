
factorials: .word 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880  # Fatoriais de 0 a 9

_start:
    addi x5, x0, 5              # Número máximo de dígitos
    addi x10, x0, 0             # Inicializa soma dos fatoriais

ler_digitos:
    beq x5, x0, calcular        # Se leu todos os dígitos, vai para calcular
    lw x20, 1025(x0)            # Lê o próximo dígito
    addi x20, x20, -48          # Converte de ASCII para número
    slli x21, x20, 2            # Multiplica o dígito por 4 (tamanho de uma palavra)
    la x22, factorials          # Carrega o endereço base do array de fatoriais
    add x21, x21, x22           # Calcula o endereço do fatorial do dígito
    lw x23, 0(x21)              # Carrega o fatorial do dígito
    add x10, x10, x23           # Adiciona o fatorial à soma
    addi x5, x5, -1             # Decrementa o contador de dígitos
    jal x0, ler_digitos               # Volta para ler o próximo dígito

calcular:
    add x12, x0, x10            # Move a soma dos fatoriais para x12

imprimir:
    # Inicializa registradores para a impressão
    add x30, x0, x0
    add x31, x0, x0 
    addi x12, x0, 10

extrair_digito:
    add x10, x0, x0
    add x11, x0, x0
    addi x12, x0, 10
    blt x30, x12, imprimir_unidade

extrair_loop:	
    addi x10, x10, 1
    addi x11, x11, 10
    addi x12, x11, 10
    bge x30, x12, extrair_loop

imprimir_digito:
    sub x30, x30, x11
    addi x30, x30, 0x30
    sw x30, 1024(x0)
    add x30, x0, x10
    blt x0, x30, extrair_digito

imprimir_unidade:
    addi x30, x30, 0x30
    sw x30, 1024(x0)
    jal x0, _exit



