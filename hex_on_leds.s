; @author Osama Aboukoura
; hex_on_leds.s : displays hex numbers on the LEDs

; specifying equivalent symbols
.equ SREG , 0x3f		; status register. See data sheet , p.11
.equ PORTB, 0x05        ; see data sheet , p.12
.equ DDRB, 0x04         ; See data sheet , p.12

; specifying the start address
.org 0

main :	ldi r16,0 		; setting the r16 register to 0
	out SREG,r16		; clearing SREG

    ldi r16,0x0F        ; setting the r16 register to 0x0F
    out DDRB,r16        ; giving permission to access bits 0-3 in PORTB

	ldi r16,0x0F
    out PORTB,r16       ; outputting the hex number 0x0F on PORTB using the LEDs



mainloop: rjmp mainloop	; jumping to mainloop address





; my notes:
; (1) DDRB is a Data Direction Register that specifies the direction of data flow for I/O on PORTB
; (2) 0x0F is a Hexadecimal number that represents 0000 1111 in binary
; (3) by outputting 0x0F on PORTB, the first 4 LEDs will turn off while the last 4 will turn on
; (4) if DDRB was 0x0D (0000 1101 in binary) then the 2nd LED will not turn on even if we output 0x0F to PORTB
