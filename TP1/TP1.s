	AREA TP1, CODE, READONLY ; donne un nom au bloc 

	ENTRY ; marque la première instruction 

start MOV r0, #15 ; initialise les valeurs 

	MOV r1, #20 

	BL firstfunc ; Appel sous-programme 

	MOV r0, #0x18 ; 

	LDR r1, =0x20026 ; 

	SWI 0x123456 ; Termine le programme 

firstfunc 

	ADD r0, r0, r1 ; r0 = r0 + r1 

	MOV pc, lr ; retour du sous-programme 

	END ; Marque la fin du fichier 