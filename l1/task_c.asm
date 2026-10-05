.eqv ARRAY_LEN 20

.data
array:     .word 0:ARRAY_LEN
msg_count: .asciz "count = "
msg_array: .asciz "array ="
space:     .asciz " "
newline:   .asciz "\n"

.text
.globl main
main:
    la   s0, array
    li   s1, 0
    li   s2, ARRAY_LEN

read_loop:
    bge  s1, s2, read_done
    li   a7, 5
    ecall
    beqz a0, read_done
    sw   a0, 0(s0)
    addi s0, s0, 4
    addi s1, s1, 1
    j    read_loop

read_done:
    la   a0, msg_count
    li   a7, 4
    ecall
    mv   a0, s1
    li   a7, 1
    ecall
    la   a0, newline
    li   a7, 4
    ecall

    la   a0, msg_array
    li   a7, 4
    ecall
    la   t0, array
    li   t1, 0
print_loop:
    bge  t1, s1, print_done
    la   a0, space
    li   a7, 4
    ecall
    lw   a0, 0(t0)
    li   a7, 1
    ecall
    addi t0, t0, 4
    addi t1, t1, 1
    j    print_loop
print_done:
    la   a0, newline
    li   a7, 4
    ecall

    li   a7, 10
    ecall
