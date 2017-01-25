; @author Osama Aboukoura
; morse_code : broadcasts a message of the first 3 letters of my name using the Morse code and the LED

; specify equivalent symbols
.equ SREG , 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04

; specify the start address
.org 0

main :	ldi r16,0 		; set register r16 to zero
	out SREG,r16		; clear SREG.

	ldi r16,0x01
	out DDRB,r16
	
	; THE LETTER O CONSISTS OF 3 DASHES WITH 2 SPACES IN BETWEEN
	ldi r16,0x01		; the value 1 turns the LED on
	out PORTB,r16
	ldi r19, 60 		; keep the LED on for 600 ms
	call routine
	ldi r16,0x00		; the value 0 turns the LED off
	out PORTB,r16
	ldi r19, 20		; keep the LED off for 200 ms
	call routine

	ldi r16,0x01
	out PORTB,r16
	ldi r19, 60 		; keep the LED on for 600 ms
	call routine
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 20		; keep the LED off for 200 ms
	call routine

	ldi r16,0x01
	out PORTB,r16
	ldi r19, 60 		; keep the LED on for 600 ms
	call routine

	; THIS REPRESENTS THE SPACE BETWEEN THE LETTER O AND THE LETTER S
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 60		; keep the LED off for 600 ms
	call routine

	; THE LETTER S CONSISTS OF 3 DOTS WITH 2 SPACES IN BETWEEN 
	ldi r16,0x01		
	out PORTB,r16
	ldi r19, 20 		; keep the LED on for 200 ms
	call routine
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 20		; keep the LED off for 200 ms
	call routine

	ldi r16,0x01
	out PORTB,r16
	ldi r19, 20 		; keep the LED on for 200 ms
	call routine
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 20		; keep the LED off for 200 ms
	call routine

	ldi r16,0x01
	out PORTB,r16
	ldi r19, 20 		; keep the LED on for 200 ms
	call routine

	; THIS REPRESENTS THE SPACE BETWEEN THE LETTER S AND THE LETTER A
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 60		; keep the LED off for 600 ms
	call routine

	; THE LETTER A CONSISTS OF 1 DOT THEN 1 DASH WITH 1 SPACE IN BETWEEN 
	ldi r16,0x01
	out PORTB,r16
	ldi r19, 20 		; keep the LED on for 200 ms
	call routine
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 20		; keep the LED off for 200 ms
	call routine

	ldi r16,0x01
	out PORTB,r16
	ldi r19, 60 		; keep the LED on for 600 ms
	call routine
	
	; THIS REPRESENTS THE FINAL SPACE AFTER THE LETTER A 
	ldi r16,0x00
	out PORTB,r16
	ldi r19, 60		; keep the LED off for 600 ms
	call routine

	
mainloop: rjmp mainloop		; jump back to mainloop address

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
		ret

