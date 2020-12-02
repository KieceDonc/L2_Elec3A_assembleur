			AREA Copy, CODE, READONLY 
			
			IMPORT strcopy
	
			ENTRY;  

start 		LDR r1, =srcstr; pointe à la première chaîne de caractères 

			LDR r0, =dststr; pointe à la seconde chaîne de caractères 

			BL strcopy;

stop 		SWI 0x11; arrêt de l’exécution du programme 



			AREA Strings, DATA, READWRITE 

srcstr		DCB "premiere chaine - source",0; Define Constant Byte 

dststr		DCB "deuxieme chaine - destination",0 

 			
			END