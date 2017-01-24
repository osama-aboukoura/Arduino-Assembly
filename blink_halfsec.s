; @author Osama Aboukoura
; blink_halfsec.s : switches the LED on and off with a half second delay

; specify equivalent symbols
.equ SREG , 0x3f		; status register. See data sheet , p.11
.equ PORTB, 0x05        ; see data sheet , p.12
.equ DDRB, 0x04         ; See data sheet , p.12

; specify the start address
.org 0


main :	ldi r16,0 		; set register r16 to zero
	out SREG,r16		; clear SREG

    ldi r16,0x0F        ; (binary 0000 1111) bits 0, 1, 2 and 3 have the value 1
	out DDRB,r16        ; giving permission to access bits 0-3 in PORTB

	

mainloop: 
    ldi r16,0x01        ; (binary 0000 0001)
    out PORTB,r16       ; turning on the first LED only

    call halfSecDelay   ; calling the halfSecDelay function

	ldi r16,0x00        ; (binary 0000 0000)
	out PORTB,r16       ; turning off all the LEDs

	call halfSecDelay   ; calling the halfSecDelay function


rjmp mainloop           ; jump back to mainloop address



; defining the halfSecDelay function at the end of the program:

halfSecDelay:
		; delay for 0.5 second

		ldi r17, 255 
        ldi r18, 255
		ldi r19, 25

		loop1:	nop         ; no operation (1 cycle)
			dec r17         ; decrement r17 by one
			cpi r17, 0      ; compare r17 with 0
			brne loop1  	; branch if r17 is not equal to 0
			ldi r17, 255    ; 1 cycle
			dec r18         ; 1 cycle
			cpi r18, 0      ; 1 cycle
			brne loop1      ; 2 cycles when jumping, 1 otherwise
			ldi r18, 255    ; 1 cycle
			dec r19         ; 1 cycle
			cpi r19, 0      ; 1 cycle
            brne loop1      ; 2 cycles when jumping, 1 otherwise
            ret             ; return back to the main program





; my notes:
; (1) the led will constantly keep turning on and off because the program is running through an infinite loop
; (2) rjmp  mainloop is jumping back to the line that is labelled mainloop and thats causing an infinite loop
; (3) the Arduino has a 16 MHz board. so 1ms delay requires 16,000 cycles and 0.5 seconds requires 8,000,000 cycles
; (4) the largest number a register can handle is 255, so: 8 MHz = 255 x 255 x 25 X 5

