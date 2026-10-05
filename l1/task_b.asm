.eqv GROUP_NO   26
.eqv STUDENT_NO 4
.data
space:   .asciz " "
newline: .asciz "\n"

.text
.globl main
main:
    li   a7, 5
    ecall

    mv   t0, a0
    li   t1, GROUP_NO
    ble  t0, t1, ordered
    mv   t2, t0
    mv   t0, t1
    mv   t1, t2
ordered:
    li   t4, STUDENT_NO
    sub  t2, t1, t4
    mv   t3, t0
loop:
    mv   a0, t3
    li   a7, 1
    ecall
    bgt  t3, t2, done
    la   a0, space
    li   a7, 4 
    ecall
    add  t3, t3, t4
    j    loop
done:
    la   a0, newline
    li   a7, 4
    ecall

    li   a7, 10
    ecall
