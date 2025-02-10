; DCF77Clock
; @hpsaturn 2025

main:     ; The main loop of the program.


gpio_loop:
mov r1, 0       ; Zero out R1
mov r0, [0x0B]  ; Read input pin status into R0
bit r0, 1       ; If first bit of R0 is 0, set Z flag
skip nz, 1      ; Skip next line if Z is NOT set
mov r1, 15      ; Put 15 into R1
