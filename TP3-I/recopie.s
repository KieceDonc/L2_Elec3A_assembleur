			AREA StringCopy, CODE, READONLY 
			
			EXPORT strcopy
	
strcopy		LDRB r2, [r1],#1; Charge un octet et met à jour les adresses 

			STRB r2, [r0],#1; Sauvegarde un octet et met à jour les adresses 

			CMP	r2, #0;

			BNE	strcopy;
			
			MOV pc,lr; retour dans le programme principal si condition on vérifiée 

			END