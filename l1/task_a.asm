.eqv STUDENT_NO 4

.data
newline: .asciz "\n"

.text
.globl main
main:
    li   a7, 5
    ecall

    li   t0, STUDENT_NO
    beq  a0, t0, match
    li   a0, 0
    j    print
match:
    li   a0, 1
print:
    li   a7, 1
    ecall
    la   a0, newline
    li   a7, 4
    ecall

    li   a7, 10
    ecall
