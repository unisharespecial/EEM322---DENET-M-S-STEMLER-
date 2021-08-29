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
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	MOVLW	0X08
	MOVWF	PORTB
	
TARA
	MOVLW	0X1F
	XORWF	PORTA
	BTFSC	STATUS,2	;E��T DEY�LSE ATLA
	GOTO	TARA
	
	MOVLW	0X1D
	XORWF	PORTA
	BTFSC	STATUS,2
	GOTO	BIR

	MOVLW	0X1B
	XORWF	PORTA
	BTFSC	STATUS,2
	GOTO	IKI

	MOVLW	0X0F
	XORWF	PORTA
	BTFSC	STATUS,2
	GOTO	UC
	
HATA
	MOVLW	0XDD
	MOVWF	PORTB
	GOTO	BEKLE
	
BEKLE
	NOP
	GOTO	BEKLE

BIR	
	MOVLW	0X1C
	MOVWF	PORTB
	GOTO	BEKLE
	
IKI
	MOVLW	0XBB
	MOVWF	PORTB
	GOTO	BEKLE

UC
	MOVLW	0XBE
	MOVWF	PORTB
	GOTO	BEKLE

	END

