; @author Osama Aboukoura
; pattern1.s: light moving back and forth on a straight line.
; The hex decimal numbers that will light the LEDs in a line: 1, 3, 7, F, 1F, 3F, 7F, FF

; specify equivalent symbols
.equ SREG , 0x3f
.equ PORTB, 0x05
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ DDRD, 0x0A

; specify the start address
.org 0

main :	ldi r16,0 		; set register r16 to zero
        out SREG,r16		; clear SREG.

        ldi r16,0x0F
        out DDRB,r16

        ldi r16,0xF0
        out DDRD,r16

        ; note how we used DDRB for the lower 4 bits of a number (the first four bits)
        ; and we then used DDRD for the upper 4 bits of a number (the last four bits)
        ; and thats because a PORT cannot hadle more than 4 bits

mainloop: 
    	ldi r19, 10         	; time delay: keep the LED on for 50 ms (it gets updated in the last line of the routine)



    	; hex numbers below 10 are written out using PORT B

    	ldi r16,0x01		; 1 (hex number)
    	out PORTB,r16
    	call routine

    	ldi r16, 0x03     	; 3 (hex number)
    	out PORTB,r16	
    	call routine


	ldi r16, 0x07       	; 7 (hex number)
	out PORTB,r16
	call routine


	ldi r16, 0x0F 		; F (hex number)
	out PORTB,r16
	call routine

	; hex numbers that are greater than or equal to 10 are written out using PORT D
	
	ldi r16, 0x1F       	; 1F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0x3F	       ; 3F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0x7F       	; 7F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0xFF       	; FF (hex number)
	out PORTD,r16
	call routine

	; going backwards
	
	ldi r16, 0x7F       	; 7F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0x3F       	; 3F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0x1F       	; 1F (hex number)
	out PORTD,r16
	call routine

	ldi r16, 0x00       	; turn off PORTD
	out PORTD,r16

	ldi r16, 0x0F       	; F (hex number)
	out PORTB,r16	
	call routine

	ldi r16, 0x07       	; 7 (hex number)
	out PORTB,r16
	call routine

	ldi r16, 0x03       	; 3 (hex number)
	out PORTB,r16
	call routine

	ldi r16,0x01		; 1 (hex number)
	out PORTB,r16
	call routine

	ldi r16,0x00		; 0 (hex number)
	out PORTB,r16
	call routine

	rjmp mainloop		; jump back to mainloop address


routine:
	; delay for 10 milliseconds times parameter
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
         	ldi r19, 10
		ret
