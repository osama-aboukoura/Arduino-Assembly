; @author Osama Aboukoura
; bit_shifting.s : shifts a binary number displayed on the LEDs left and right with a delay in between

; specify equivalent symbols
.equ SREG , 0x3f		; Status register. See data sheet , p.11
.equ PORTB, 0x05        
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ DDRD, 0x0A

; specify the start address
.org 0

; reset system status
main :	ldi r16,0 		; set register r16 to zero
	out SREG,r16		; clear SREG.

	ldi r16,0x0F
	out DDRB,r16
	ldi r16,0xF0
	out DDRD,r16


    	; output the hexadecimal 0x55 (0x55 in HEX is 0101 0101 in Binary):

    	ldi r16,0x55
    	out PORTB,r16		; the lower 4 bits of the number 0x55
    	out PORTD,r16		; the upper 4 bits of the number 0x55

    	ldi r19, 40
    	call routine

mainloop:

	; shifting the registers one bit to the left:
	; 0101 0101 will be 1010 1010 after the shifting:
	lsl r16
	out PORTB,r16		; the lower 4 bits
	out PORTD,r16		; the upper 4 bits

    	ldi r19, 40
    	call routine

	; shifting the registers back one bit to the right:
	; 1010 1010 will be 0101 0101 after the shifting:
	lsr r16
	out PORTB,r16		; the lower 4 bits
	out PORTD,r16		; the upper 4 bits

    	ldi r19, 40
	call routine

	rjmp mainloop		; jump back to mainloop address


routine:
	; this routine delays for (10 X parameter) milliseconds
    	ldi r17, 255
    	ldi r18, 126

    	loop1:	nop
        	dec r17
        	cpi r17, 0
        	brne loop1
        	ldi r17, 255
        	dec r18
        	cpi r18, 0
        	brne loop1
        	ldi r18, 126
        	dec r19
        	cpi r19, 0
        	brne loop1
        	ldi r19, 40
        	ret


; my notes:
; (1) the largest number that can be displayed on the LEDs using PORTB is the 15 (hex: F - binary: 1111)
; (2) to display a larger number than the decimal 15, we need to use more than PORT.
; (3) PORTB controls the lower 4 bits and displays the corresponding 4 LEDs
; (4) PORTD controls the upper 4 bits and displays the corresponding 4 LEDs
; (5) lsl multiplies the given number by 2 and so effectivley it is shifting the binary number to the left
; (6) and lsr divides the given number by 2 and so effectivley it is shifting the binary number to the right
; (7) we have changed the routine we wrote in the previous program to make r19 a parameter
