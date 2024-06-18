#leitura daa entrada
lb x10,1025(x0)
lb x11,1025(x0)
lb x12,1025(x0)
lb x13,1025(x0)
lb x14,1025(x0)




# Verificação do primeiro fatorial

add x23,x23,x0   # Inicializa x23 (usado para o resultado) com 0
add x22,x22,x0   # Inicializa x22 (usado para comparação) com 0
addi x22,x22,49  # Incrementa x22 para 49
beq x10,x0,read  # Se x10 == 0, vá para "read"
beq x10,x22,one  # Se x10 == x22, vá para "one"

# Sequência similar de comparações e saltos para diferentes fatoriais

addi x22,x22,1
beq x10,x22,two
addi x22,x22,1
beq x10,x22,three
addi x22,x22,1
beq x10,x22,four
addi x22,x22,1
beq x10,x22,five
addi x22,x22,1
beq x10,x22,six
addi x22,x22,1
beq x10,x22,seven
addi x22,x22,1
beq x10,x22,eight
addi x22,x22,1
beq x10,x22,nine

#soma do primeiro fatorial
#soma um

one:
 addi x23,x23,1
 beq x0,x0,read
#soma 2
two:
 addi x23,x23,2
 beq x0,x0,read
#soma 6
three:
 addi x23,x23,6
 beq x0,x0,read
#soma 24
four:
 addi x23,x23,24
 beq x0,x0,read
#soma 120
five:
 addi x23,x23,120
 beq x0,x0,read
#soma 720
six:
 addi x23,x23,720
 beq x0,x0,read
#soma 5040
seven:
 addi x23,x23,2000
 addi x23,x23,2000
 addi x23,x23,1040
 beq x0,x0,read
#soma 40320
eight:  
 addi x15,x15,1250
 slli x15,x15,5
 addi x15,x15,320
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,read
#soma 362880
nine:
 addi x15,x15,2000
 addi x15,x15,835
 slli x15,x15,7
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,read
 
#verificacao do segundo fatorial

read:
 sub x22,x22,x22
 addi x22,x22,49
 beq x11,x0,reada
 beq x11,x22,onea
 addi x22,x22,1
 beq x11,x22,twoa
 addi x22,x22,1
 beq x11,x22,threea
 addi x22,x22,1
 beq x11,x22,foura
 addi x22,x22,1
 beq x11,x22,fivea
 addi x22,x22,1
 beq x11,x22,sixa
 addi x22,x22,1
 beq x11,x22,sevena
 addi x22,x22,1
 beq x11,x22,eighta
 addi x22,x22,1
 beq x11,x22,ninea
 
#soma do segundo fatorial

onea:
 addi x23,x23,1
 beq x0,x0,reada
twoa:
 addi x23,x23,2
 beq x0,x0,reada
threea:
 addi x23,x23,6
 beq x0,x0,reada
foura:
 addi x23,x23,24
 beq x0,x0,reada
fivea:
 addi x23,x23,120
 beq x0,x0,reada
sixa:
 addi x23,x23,720
 beq x0,x0,reada
sevena:
 addi x23,x23,2000
 addi x23,x23,2000
 addi x23,x23,1040
 beq x0,x0,reada
eighta:
 addi x15,x15,1250
 slli x15,x15,5
 addi x15,x15,320
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,reada
ninea:
 addi x15,x15,2000
 addi x15,x15,835
 slli x15,x15,7
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,reada
 
#verificacao do terceiro fatorial

reada:
 sub x22,x22,x22
 addi x22,x22,49
 beq x12,x0,readb
 beq x12,x22,onec
 addi x22,x22,1
 beq x12,x22,twoc
 addi x22,x22,1
 beq x12,x22,threec
 addi x22,x22,1
 beq x12,x22,fourc
 addi x22,x22,1
 beq x12,x22,fivec
 addi x22,x22,1
 beq x12,x22,sixc
 addi x22,x22,1
 beq x12,x22,sevenc
 addi x22,x22,1
 beq x12,x22,eightc
 addi x22,x22,1
 beq x12,x22,ninec
 
#soma terceiro fatorial

onec:
 addi x23,x23,1
 beq x0,x0,readb
twoc:
 addi x23,x23,2
 beq x0,x0,readb
threec:
 addi x23,x23,6
 beq x0,x0,readb
fourc:
 addi x23,x23,24
 beq x0,x0,readb
fivec:
 addi x23,x23,120
 beq x0,x0,readb
sixc:
 addi x23,x23,720
 beq x0,x0,readb
sevenc:
 addi x23,x23,2000
 addi x23,x23,2000
 addi x23,x23,1040
 beq x0,x0,readb
eightc:
 addi x15,x15,1250
 slli x15,x15,5
 addi x15,x15,320
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,readb
ninec:
 addi x15,x15,2000
 addi x15,x15,835
 slli x15,x15,7
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,readb
 
#verificacao do quarto fatorial

readb:
 sub x22,x22,x22
 addi x22,x22,49
 beq x13,x0,readc
 beq x13,x22,oned
 addi x22,x22,1
 beq x13,x22,twod
 addi x22,x22,1
 beq x13,x22,threed
 addi x22,x22,1
 beq x13,x22,fourd
 addi x22,x22,1
 beq x13,x22,fived
 addi x22,x22,1
 beq x13,x22,sixd
 addi x22,x22,1
 beq x13,x22,sevend
 addi x22,x22,1
 beq x13,x22,eightd
 addi x22,x22,1
 beq x13,x22,nined
 
#soma do quarto fatorial

oned:
 addi x23,x23,1
 beq x0,x0,readc
twod:
 addi x23,x23,2
 beq x0,x0,readc
threed:
 addi x23,x23,6
 beq x0,x0,readc
fourd:
 addi x23,x23,24
 beq x0,x0,readc
fived:
 addi x23,x23,120
 beq x0,x0,readc
sixd:
 addi x23,x23,720
 beq x0,x0,readc
sevend:
 addi x23,x23,2000
 addi x23,x23,2000
 addi x23,x23,1040
 beq x0,x0,readc
eightd:
 addi x15,x15,1250
 slli x15,x15,5
 addi x15,x15,320
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,readc
nined:
 addi x15,x15,2000
 addi x15,x15,835
 slli x15,x15,7
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,readc
 
#verificacao do quinto fatorial

readc:
 sub x22,x22,x22
 addi x22,x22,49
 beq x14,x0,fim
 beq x14,x22,onee
 addi x22,x22,1
 beq x14,x22,twoe
 addi x22,x22,1
 beq x14,x22,threee
 addi x22,x22,1
 beq x14,x22,foure
 addi x22,x22,1
 beq x14,x22,fivee
 addi x22,x22,1
 beq x14,x22,sixe
 addi x22,x22,1
 beq x14,x22,sevene
 addi x22,x22,1
 beq x14,x22,eighte
 addi x22,x22,1
 beq x14,x22,ninee
 
#soma do quinto fatorial

onee:
 addi x23,x23,1
 beq x0,x0,fim
twoe:
 addi x23,x23,2
 beq x0,x0,fim
threee:
 addi x23,x23,6
 beq x0,x0,fim
foure:
 addi x23,x23,24
 beq x0,x0,fim
fivee:
 addi x23,x23,120
 beq x0,x0,fim
sixe:
 addi x23,x23,720
 beq x0,x0,fim
sevene:
 addi x23,x23,2000
 addi x23,x23,2000
 addi x23,x23,1040
 beq x0,x0,fim
eighte:
 addi x15,x15,1250
 slli x15,x15,5
 addi x15,x15,320
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,fim
ninee:
 addi x15,x15,2000
 addi x15,x15,835
 slli x15,x15,7
 add x23,x23,x15
 sub  x15,x15,x15
 beq x0,x0,fim
 
#verifica o total da soma

fim:
 sub x22,x22,x22
 addi x22,x22,1875
 slli x22,x22,3
 addi x22,x22,625
 slli x22,x22,6
 sub x10,x10,x10
 addi x10,x10,48
 bge x23,x22,calculo_mm
 sub x22,x22,x22
 bge x23,x22,check_cm
 bge x23,x22,check_dm
 bge x23,x22,check_m
 bge x23,x22,check_c
 bge x23,x22,check_d
 bge x23,x22,check_u
 
 # Cálculos para determinar os dígitos em diferentes posições (milhões, centenas de milhares, etc.)
 
#mm representa a casa do milhoes

calculo_mm:
 addi x24,x24,1
 addi x10,x10,1
 sub x23,x23,x22
 bge x23,x22,loop_mm
 beq x0,x0,check_cm
loop_mm:
 sub x23,x23,x22
 addi x10,x10,1
 bge x23,x22,loop_mm
 beq x0,x0,check_cm
 
#cm representa a casa dos cetenas de milhs

check_cm:
 sub x22,x22,x22
 addi x22,x22,2000
 addi x22,x22,1125
 slli x22,x22,5
 sub x11,x11,x11
 addi x11,x11,48
 bge x23,x22,calculo_cm
 beq x0,x0,check_dm
calculo_cm:
 sub x23,x23,x22
 addi x11,x11,1
 bge x23,x22,loop_cm
 beq x0,x0,check_dm
loop_cm:
 sub x23,x23,x22
 addi x11,x11,1
 bge x23,x22,loop_cm
 beq x0,x0,check_dm
 
#dm representa a casa dos dezenas de milhs

check_dm:
 sub x22,x22,x22
 addi x22,x22,2000
 addi x22,x22,500
 slli x22,x22,2
 sub x12,x12,x12
 addi x12,x12,48
 bge x23,x22,calculo_dm
 beq x0,x0,check_m
calculo_dm:
 sub x23,x23,x22
 addi x12,x12,1
 bge x23,x22,loop_dm
 beq x0,x0,check_m
loop_dm:
 sub x23,x23,x22
 addi x12,x12,1
 bge x23,x22,loop_dm
 beq x0,x0,check_m
 
#m represensenta as unidades de milhs

check_m:
 sub x22,x22,x22
 addi x22,x22,1000
 sub x13,x13,x13
 addi x13,x13,48
 bge x23,x22,calculo_m
 beq x0,x0,check_c
calculo_m:
 sub x23,x23,x22
 addi x13,x13,1
 bge x23,x22,loop_m
 beq x0,x0,check_c
loop_m:
 sub x23,x23,x22
 addi x13,x13,1
 bge x23,x22,loop_m
 beq x0,x0,check_c
 
#c representa a casa das cents

check_c:
 sub x22,x22,x22
 addi x22,x22,100
 sub x14,x14,x14
 addi x14,x14,48
 bge x23,x22,calculo_c
 beq x0,x0,check_d
calculo_c:
 sub x23,x23,x22
 addi x14,x14,1
 bge x23,x22,loop_c
 beq x0,x0,check_d
loop_c:
 sub x23,x23,x22
 addi x14,x14,1
 bge x23,x22,loop_c
 beq x0,x0,check_d
 
#d representa a casa das dezs

check_d:
 sub x22,x22,x22
 addi x22,x22,10
 sub x15,x15,x15
 addi x15,x15,48
 bge x23,x22,calculo_d
 beq x0,x0,check_u
calculo_d:
 sub x23,x23,x22
 addi x15,x15,1
 bge x23,x22,loop_d
 beq x0,x0,check_u
loop_d:
 sub x23,x23,x22
 addi x15,x15,1
 bge x23,x22,loop_d
 beq x0,x0,check_u
 
#u representa a casa da unids

check_u:
 sub x22,x22,x22
 addi x22,x22,1
 sub x16,x16,x16
 addi x16,x16,48
 bge x23,x22,calculo_u
 beq x0,x0,print
calculo_u:
 sub x23,x23,x22
 addi x16,x16,1
 bge x23,x22,loop_u
 beq x0,x0,print
loop_u:
 sub x23,x23,x22
 addi x16,x16,1
 bge x23,x22,loop_u
 beq x0,x0,print
 
#verifica quantos algorismos precisa printar

print:
 addi x23,x23,48
 bne x10,x23,print7
 bne x11,x23,print6
 bne x12,x23,print5
 bne x13,x23,print4
 bne x14,x23,print3
 bne x15,x23,print2
 bne x16,x23,print1
print7:
 sb x10,1024(x0)
 sb x11,1024(x0)
 sb x12,1024(x0)
 sb x13,1024(x0)
 sb x14,1024(x0)
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
print6:
 sb x11,1024(x0)
 sb x12,1024(x0)
 sb x13,1024(x0)
 sb x14,1024(x0)
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
print5:
 sb x12,1024(x0)
 sb x13,1024(x0)
 sb x14,1024(x0)
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
print4:
 sb x13,1024(x0)
 sb x14,1024(x0)
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
print3:
 sb x14,1024(x0)
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
print2:
 sb x15,1024(x0)
 sb x16,1024(x0)
 beq x0,x0,encerrar
 print1:
 sb x16,1024(x0)
 beq x0,x0,encerrar
encerrar:
 halt