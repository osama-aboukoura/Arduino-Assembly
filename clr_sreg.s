; @author Osama Aboukoura
; this program clears the status register (SREG)


.equ SREG, 0x0f         ; defining the SREG label

.org 0                  ; specifying the start address


main:   ldi r16,0       ; setting register r16 to zero
        out SREG,r16 	  ; copying the contents of r16 to SREG , i.e. , clear SREG

mainloop: rjmp mainloop ; jumping to mainloop address





; my notes:
; (1) .equ is to give a symbolic name (or a label) to a numeric constant
; (2) main is where the program starts
; (3) rjmp mainloop is a jump to the line that has mainloop as a label
; (4) to make more use of rjmp, ideally we would jump to a different line in the code
; (5) mainloop: rjmp mainloop keeps the program constantly running
