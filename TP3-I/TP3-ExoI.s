			AREA Copy, CODE, READONLY 
			
			IMPORT strcopy
	
			ENTRY;  

start 		LDR r1, =srcstr; pointe � la premi�re cha�ne de caract�res 

			LDR r0, =dststr; pointe � la seconde cha�ne de caract�res 

			BL strcopy;

stop 		SWI 0x11; arr�t de l�ex�cution du programme 



			AREA Strings, DATA, READWRITE 

srcstr		DCB "premiere chaine - source",0; Define Constant Byte 

dststr		DCB "deuxieme chaine - destination",0 

 			
			END