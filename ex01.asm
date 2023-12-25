section .data

section .text
global _start

_start:
    ; Load the 16-bit numbers into AX and BX registers
    mov ax, 1234h     ; Replace 1234h with your first 16-bit number
    mov bx, 5678h     ; Replace 5678h with your second 16-bit number

    ; Initialize result registers
    xor dx, dx        ; Clear the high 16 bits of the result (DX)

    ; Multiply AX and BX using rotational shift
    mov cx, 16        ; Set loop counter to 16 for 16-bit multiplication
multiply_loop:
    shl ax, 1         ; Shift left AX by 1 bit (multiply by 2)
    rcl dx, 1         ; Rotate carry flag into the low bit of DX
    rcl bx, 1         ; Rotate carry flag into the low bit of BX

    ; Check the least significant bit of the original AX
    test ax, 1
    jz no_addition    ; If the bit is zero, skip addition

    ; Add the original BX to the result
    add dx, bx

no_addition:
    loop multiply_loop ; Repeat the loop until the counter is zero

    ; The result is now in DX:AX
    ; DX contains the high 16 bits, and AX contains the low 16 bits

    ; You can now use the result as needed

    ; Exit the program
    mov ax, 0x4c00    ; Exit code 0
    int 0x80           ; Call kernel

