		.MODEL SMALL
		.STACK 64
		.DATA
		ORG	0100H
CUMLE          	DB	100 DUP (?)
YEDEK		DB	100 DUP (?)			


		.CODE		
MAIN		PROC	FAR		
		MOV	AX,@DATA	
		MOV	DS,AX		
		MOV	AX,0
		MOV	SI,OFFSET CUMLE		
		MOV 	CX,100

KLAVYEDENOKU:
		MOV	AH,0
		INT 	16H
		MOV	[SI],AL
		INC	SI
		MOV	DL,AL
		MOV	AH,02
		INT	21H
		CMP	AL,' '		
		JNZ	BITTIMI        
		INC	BX
		LOOP	KLAVYEDENOKU
		
BITTIMI:	
		CMP	AL,'.'		
		JZ	BITTI		
		LOOP    KLAVYEDENOKU
		
BITTI:		
		MOV	AX,0
		MOV 	AL,BL
		MOV	CL,0AH
		DIV	CL		
		MOV	BX,AX
		
		MOV	AH,02
		MOV	DL,9			
		INT	21H
		
		MOV	AH,02H
		MOV	DL,BL
		OR	DL,30H	
		INT 	21H
		MOV	DL,BH
		OR	DL,30H
		INT	21H
		
ENTERBEKLE:
		MOV	AH,0
		INT	16H
		CMP	AL,'q'
		JZ	SONLANDIR
		CMP	AL,0DH
		JNZ	ENTERBEKLE

		DEC	SI
		DEC	SI

SONKELIMEBUL:
		MOV	BL,[SI]
		DEC	SI
		CMP	BL,' '
		JNZ	SONKELIMEBUL

		INC	SI	
		MOV	BX,SI


		MOV	DI,OFFSET YEDEK
BASAAT:		
		MOV	CL,[SI]
		MOV	[DI],CL
		INC	DI
		CMP	CL,'.'
		JNZ	BASAAT

		DEC	DI
		MOV	CL,' '
		MOV	[DI],CL
		MOV	SI,OFFSET CUMLE
		
KOPYALA:	
		INC	DI
		MOV	CL,[SI]
		MOV	[DI],CL
		INC	SI
		CMP	SI,BX
		JNZ	KOPYALA

		INC	DI
		MOV	CL,'.'
		MOV	[DI],CL

		MOV	SI,OFFSET CUMLE
		MOV	DI,OFFSET YEDEK

GERIKOPYALA:
		MOV	CL,[DI]
		MOV	[SI],CL
		INC	DI
		INC	SI
		CMP	CL,'.'
		JNZ	GERIKOPYALA

		MOV	CL,'$'
		MOV	[SI],CL

		MOV	AH,02H
		MOV	DL,09H
		INT	21H

		MOV	AH,09
		MOV	DX,OFFSET CUMLE
		INT	21H

		JMP	ENTERBEKLE

SONLANDIR:

		ENDP
		END MAIN




