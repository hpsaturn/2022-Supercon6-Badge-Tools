; DCF77Clock
; @hpsaturn 2025

init:
mov r0, 2        ; Move to page 2
mov [0xF0], r0

; mov r0, 4   ; Set CPU speed
; mov [0xF1], r0

main:     ; The main loop of the program.
gosub pulse_off
mov r1, 0       ; Zero out R1
mov r0, [0x0B]  ; Read input pin status into R0
bit r0, 1       ; If first bit of R0 is 0, set Z flag
skip nz, 1      ; Skip next line if Z is NOT set
goto pulse_on
goto main

clear_disp:
; clear screen first
; blank the matrix first for a fresh draw
mov r0, 0
mov r7, 0
mov r5, 0
mov r3, 2
mov r4, 3
mov [r3:r5], r0
mov [r4:r5], r0
inc r5
dsz r7
jr -5

ret r0, 0

pulse_off:
gosub clear_disp
ret r0, 0

pulse_on:
; clear screen first
; blank the matrix first for a fresh draw
gosub clear_disp

mov r5, 0b0011   ; Left side of icon 
mov r6, 0b1100   ; Right side of icon

mov r2, 2        ; Register for page 2
mov r3, 3        ; Register for page 3
mov r4, 14       ; Start at row 14

mov r0, r5       ; Get left side data into R0
mov [r3:r4], r0  ; Draw left side
mov r0, r6       ; Get right side data into R0
mov [r2:r4], r0  ; Draw right side
dsz r4           ; Decrement row
jr -6            ; Draw 14 rows

mov r0, 0        ; Clear line at bottom
mov [3:11], r0   ;  
mov [2:11], r0   ;

goto main



; mov r1, 0       ; Zero out R1
; mov r0, [0x0B]  ; Read input pin status into R0
; bit r0, 1       ; If first bit of R0 is 0, set Z flag
; skip nz, 1      ; Skip next line if Z is NOT set
; mov r1, 15      ; Put 15 into R1
