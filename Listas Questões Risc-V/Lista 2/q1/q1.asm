_start:
	addi x7, x0, 0x0

# Usar o "-" para separar as palavras;

# Loop para ir pegando as palavras;
loop:
    # Ler do teclado;
    lw x6, 1025(x0)
    
    # Encerrar caso vazio;
	beq x0, x6, _END
    
    # Verificar leitura;
    lw x10, sep
	beq x6, x10, _OTHER
    
    # Verificar cada grupo de letras;
	lw x10, A
	beq x6, x10, _AEIOU
	lw x10, E
	beq x6, x10, _AEIOU
	lw x10, I
	beq x6, x10, _AEIOU
	lw x10, O
	beq x6, x10, _AEIOU
	lw x10, U
	beq x6, x10, _AEIOU

	lw x10, D
	beq x6, x10, _DGT
	lw x10, G
	beq x6, x10, _DGT
	lw x10, T
	beq x6, x10, _DGT

	lw x10, B
	beq x6, x10, _BCMNP
	lw x10, C
	beq x6, x10, _BCMNP
	lw x10, M
	beq x6, x10, _BCMNP
	lw x10, N
	beq x6, x10, _BCMNP
	lw x10, P
	beq x6, x10, _BCMNP

	lw x10, F
	beq x6, x10, _FHVWY
	lw x10, H
	beq x6, x10, _FHVWY
	lw x10, V
	beq x6, x10, _FHVWY
	lw x10, W
	beq x6, x10, _FHVWY
	lw x10, Y
	beq x6, x10, _FHVWY

	lw x10, K
	beq x6, x10, _KRS
	lw x10, R
	beq x6, x10, _KRS
	lw x10, S
	beq x6, x10, _KRS

	lw x10, J
	beq x6, x10, _JXL
	lw x10, L
	beq x6, x10, _JXL
	lw x10, X
	beq x6, x10, _JXL

	lw x10, Q
	beq x6, x10, _QZ
	lw x10, Z
	beq x6, x10, _QZ
	
	beq x0, x0, _END

# Redefinir o loop ao checar o "-";
_OTHER:
	add x30, x0, x7
	add x7, x0, x0
	beq x0, x0, loop

# Entrada para somar cada grupo de letras
_QZ:
	addi x7, x7, 6
	beq x0, x0, loop

_JXL:
	addi x7, x7, 8
	beq x0, x0, loop

_KRS:
	addi x7, x7, 5
	beq x0, x0, loop

_FHVWY:
	addi x7, x7, 2
	beq x0, x0, loop

_BCMNP:
	addi x7, x7, 4
	beq x0, x0, loop

_DGT:
	addi x7, x7, 1
	beq x0, x0, loop
	
_AEIOU:
	addi x7, x7, 3
	beq x0, x0, loop

# Checar os pontos;
_END:
	beq x7, x30, _IGUAL
	blt x7, x30, _AMAIOR
	beq x0, x0, _BMAIOR

_IGUAL:
	lw x10, zero
	sw x10, 1024(x0)
	beq x0, x0, _end

_BMAIOR:
	lw x10, B
	sw x10, 1024(x0)
	beq x0, x0, _end

_AMAIOR:
	lw x10, A
	sw x10, 1024(x0)
	beq x0, x0, _end

# Finalizar 
_end:
	lw x0, 1024(x0)

zero: .word 0x30
A: .word 0x41
B: .word 0x42
C: .word 0x43
D: .word 0x44
E: .word 0x45
F: .word 0x46
G: .word 0x47
H: .word 0x48
I: .word 0x49
J: .word 0x4a
K: .word 0x4b
L: .word 0x4c
M: .word 0x4d
N: .word 0x4e
O: .word 0x4f
P: .word 0x50
Q: .word 0x51
R: .word 0x52
S: .word 0x53
T: .word 0x54
U: .word 0x55
V: .word 0x56
W: .word 0x57
X: .word 0x58
Y: .word 0x59
Z: .word 0x5a
sep: .word 0x2d
