		AREA TP2, CODE, READONLY;
		ENTRY
debut	MVN		r0,#11; A (dividende)
		MVN		r1,#3; B (diviseur)
		MOV 	r2,#1; A/B (quotient)
		MOV		r3,#1; (reste)
		MOV 	r4,#0; booleen si resultat à besoin d'être changé en negatif( 0 = non, 1 = oui )
		
	    CMP 	r0,#0;  
	    CMPEQ	r1,#0; 
        BGE 	bouclI; a et b POSITIF resultat positif ( pas besoin d'être changé )
        
	    CMP		r0,#0; if ( r0<0 ) 
	    CMPEQ	r1,#0; if ( r1<0 )
		MVNLT	r0,r0; On passe A de négatif à positif 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le complément à deux mais n'ajoute pas 1
		MVNLT	r1,r1; On passe B de négatif à positif 
		ADDLT	r1,r1,#1; on ajoute 1 car MVN fait le complément à deux mais n'ajoute pas 1
        BLT 	bouclI; a et b negatif resultat positif ( pas besoin d'être changé )
        
        
       	CMP		r0,#0; 
       	MOV		r4,#1; A < 0 alors le résultat sera négatif ( on modifie le booléen )
		MVN		r1,r1; On passe B de négatif à positif ( nécéssaire pour le nombre d'itération ) 
       	MVNLT	r0,r0; A < 0 On passe A de négatif à positif 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le complément à deux mais n'ajoute pas 1
       	BLT 	bouclI; Si A < 0 le résultat sera déjà en négatif donc pas besoin de changer le signe
        
        MOV		r4,#1; B < 0 alors le résultat sera en positif mais il a besoin d'être changer en négatif ( on modifie le booléen )
		MVN		r1,r1; On passe B de négatif à positif ( nécéssaire pour le nombre d'itération ) 
		ADD		r1,r1,#1; on ajoute 1 car MVN fait le complément à deux mais n'ajoute pas 1

bouclI  MOV		r5,r0; initialisation de temp A		
boucl	CMP		r5,r1; tant que Temp A > B
		BLE		endB;  
		SUB		r5,r5,r1; on déduit temp A au résultat ( on va le faire B fois, ainsi on va faire A / B )
		ADD 	r2,r2,#1; on incrémente notre compteur d'itération
		B		boucl;    

endB	SUB		r3,r1,r5; on calcul le reste
		MOVEQ	r4,#0; if(r4==0); on regarde si on a besoin de modifier notre résultat
		BEQ		fin; non pas besoin
		MVN 	r2,r2; on passe notre résultat en négatif
		ADD 	r2,r2,#1; on ajoute 1 car MVN fait le complément à deux mais n'ajoute pas 1

fin		SWI		0x123456;
		END  