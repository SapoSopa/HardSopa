# CPI calculado para o pior caso: 1001;
#   Tempo de execução: 0,74 segundos;
#   Número de cilos: 74;
#   Número de instruções: 19;
#   CPI = 74/19 = 3,89;

# Sempre após digitar um número, lembre-se de limpar o display de 7 segmentos

_start:
# Definir valor inicial
    addi x21, x0, 1
ler:
# Ler valor do teclado
    lb x12, 1025(x0)
    lb x13, 1025(x0)
    lb x14, 1025(x0)
    lb x15, 1025(x0)
# Ajustar valor de ASCII
    addi x12, x12, -48
    addi x13, x13, -48
    addi x14, x14, -48
    addi x15, x15, -48

# Verificar qual o exato binário
    beq x12, x0, _zero
    beq x12, x21, _um
_zero:
    beq x13, x0, _zerozero
    beq x13, x21, _zeroum
_zerozero:
    beq x14, x0, _zerozerozero
    beq x14, x21, _zerozeroum
_zerozerozero:
    beq x15, x0, _dzero
    beq x15, x21, _dum
_zerozeroum:
    beq x15, x0, _ddois
    beq x15, x21, _dtres
_zeroum:
    beq x14, x0, _zeroumzero
    beq x14, x21, _zeroumum
_zeroumzero:
    beq x15, x0, _dquatro
    beq x15, x21, _dcinco
_zeroumum:
    beq x15, x0, _dseis
    beq x15, x21, _dsete
_um:
    beq x13, x0, _umzero
    beq x13, x21, _umum
_umzero:
    beq x14, x0, _umzerozero
    beq x14, x21, clear
_umzerozero:
    beq x15, x0, _doito
    beq x15, x21, _dnove
_umum:
    beq x14, x0, clear
    beq x14, x21, clear

# Digitar o número identificado (ou limpar)
_dzero:
    addi x30, x0, 127
    sb x30, 1029(x0)
    halt
_dum:
    addi x30, x0, 6
    sb x30, 1029(x0)
    halt
_ddois:
    addi x30, x0, 27
    sb x30, 1029(x0)
    addi x30, x0, 1
    sb x30, 1027(x0)
    halt
_dtres:
    addi x30, x0, 15
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
_dquatro:
    addi x30, x0, 38
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
_dcinco:
    addi x30, x0, 45
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
_dseis:
    addi x30, x0, 61
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
_dsete:
    addi x30, x0, 7
	sb x30, 1029(x0)
    halt
_doito:
    addi x30, x0, 127
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
_dnove:
    addi x30, x0, 47
	sb x30, 1029(x0)
	addi x30, x0, 1
	sb x30, 1027(x0)
    halt
clear:
    sb x0, 1029(x0)
	sb x0, 1027(x0)
    halt