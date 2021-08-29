;as�l bu g�zel �al���yor
STATUS	EQU	0X03
PORTB	EQU	0X06
TRISB	EQU	0X86
PORTA	EQU	0X05
TRISA	EQU	0X85

	ORG	0X00
	GOTO	BASLA

BASLA
	BSF	STATUS,5
	CLRF	TRISB
	MOVLW	0X1F
	MOVWF	TRISA
	BCF	STATUS,5
	CLRF	PORTB

TEKRAR
	MOVLW	0X80	;7
	MOVWF	PORTB
	CALL	BIRSN
	RRF	PORTB;6
	CALL	BIRSN
	RRF	PORTB;5
	CALL	BIRSN
	RRF	PORTB;4
	CALL	BIRSN
	RRF	PORTB;3
	CALL	BIRSN
	RRF	PORTB;2
	CALL	BIRSN
	RRF	PORTB;1
	CALL	BIRSN
	RRF	PORTB;0
	CALL	BIRSN
	GOTO	TEKRAR

BIRSN
	MOVLW	0X01
	MOVWF	0X11
AZ3
	MOVLW	0XFF
	MOVWF	0X12
AZ2
	MOVLW	0XFF
	MOVWF	0X13
AZ1
	DECFSZ	0X13
	GOTO	AZ1
	DECFSZ	0X12
	GOTO	AZ2
	DECFSZ	0X11
	GOTO	AZ3
	RETURN

	END
