LIST P=16F84
INCLUDE "P16F84.INC"

		ORG		0X00
		GOTO	START

START
		BSF		STATUS,5
		CLRF	TRISB
		MOVLW	0X1F
		MOVWF	TRISA
		BCF		STATUS,5
		MOVLW	0X00
		MOVWF	PORTB
		MOVLW	0X08
		MOVWF	PORTB
		
BAK
		MOVLW	0X1F
		XORWF	PORTA
		BTFSC	STATUS,2
		GOTO	BAK
		
		MOVLW	0X1D
		XORWF	PORTA
		BTFSC	STATUS,2
		GOTO	B1
	
		MOVLW	0X1B
		XORWF	PORTA
		BTFSC	STATUS,2
		GOTO	B2
	
		MOVLW	0X0F
		XORWF	PORTA
		BTFSC	STATUS,2
		GOTO	B3

LOOP
		GOTO	LOOP
	
B1	
		MOVLW	0X1C
		MOVWF	PORTB
		GOTO	LOOP
		
B2
		MOVLW	0XBB
		MOVWF	PORTB
		GOTO	LOOP
	
B3
		MOVLW	0XBE
		MOVWF	PORTB
		GOTO	LOOP
	
END

