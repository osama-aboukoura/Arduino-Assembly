; @author Osama Aboukoura
; ping_pong.s: light moving back and forth on a straight line.
; The hex decimal numbers that will light the LEDs in a line: 1, 2, 4, 8, 10, 20, 40, 80

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

mainloop: 
	ldi r19, 5          	; time delay parameter of 50 ms for the routine  

	; hex numbers below 10 are written out using PORT B
	ldi r16,0x01		; 1 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine

	ldi r16, 0x02       	; 2 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine

	ldi r16, 0x04       	; 4 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine

	ldi r16, 0x08       	; 8 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine

	; hex numbers that are greater than or equal to 10 are written out using PORT D
	
	ldi r16, 0x10       	; 10 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine

	ldi r16, 0x20       	; 20 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine

	ldi r16, 0x40       	; 40 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine
	
	ldi r16, 0x80       	; 80 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine
	
	; going backwards

	ldi r16, 0x40       	; 40 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine
	
	ldi r16, 0x20       	; 20 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine
	
	ldi r16, 0x10       	; 10 (hex number)
	out PORTD,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTD,r16
	call routine

	ldi r16, 0x08       	; 8 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine
	
	ldi r16, 0x04       	; 4 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	call routine
	
	ldi r16, 0x02       	; 2 (hex number)
	out PORTB,r16
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
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
            	ldi r19, 5
		ret
			
