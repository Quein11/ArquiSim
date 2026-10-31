# Programa 24 -- Reto: contar negativos de un arreglo
#   int CONTAR(int *a, int n)  -> cuántos elementos son negativos
#   NEG = CONTAR(ARR, 8);  un píxel rojo en la fila 0 por cada negativo

.data
ARR:    .word 5, -3, 12, -8, 0, -1, 7, -20
NEG:    .word 0

.text
main:   la   $a0, ARR
        li   $a1, 8
        jal  CONTAR
        la   $t0, NEG
        sw   $v0, 0($t0)
        addi $t1, $zero, 1
        add  $t2, $zero, $zero
PINTA:  beq  $t2, $v0, FIN
        sb   $t1, 0x400($t2)
        addi $t2, $t2, 1
        j    PINTA

CONTAR: add  $v0, $zero, $zero
        add  $t0, $zero, $zero
CICLO:  beq  $t0, $a1, SALIR
        sll  $t1, $t0, 2
        add  $t1, $t1, $a0
        lw   $t2, 0($t1)
        slt  $t3, $t2, $zero
        add  $v0, $v0, $t3
        addi $t0, $t0, 1
        j    CICLO
SALIR:  jr   $ra
FIN:
