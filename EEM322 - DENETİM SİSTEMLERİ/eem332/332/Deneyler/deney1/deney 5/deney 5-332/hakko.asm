;==========================================
;===== 8BIT Input/Output TEST PROGRAM =====
;=====         FOR SKC - 86           =====
;==========================================

CNT3  		EQU  	3FD6H
APORT3		EQU  	3FD0H
BPORT3		EQU  	3FD2H
CPORT3		EQU	3FD4H
RAME			EQU	0FFFFH 
				 
CODE		SEGMENT
		ASSUME	CS:CODE, DS:CODE				 

		ORG	0				 
				 
START:	MOV	SP,RAME
		MOV	AL,90H
		MOV	DX,CNT3	
		OUT	DX,AL 

J1:		MOV	DX,APORT3
		IN	AL,DX
		NOT	AL
		MOV	DX,BPORT3
		OUT	DX,AL
		JMP	J1

CODE		ENDS
		END	START
