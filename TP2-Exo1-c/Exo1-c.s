		AREA TP2, CODE, READONLY;
		ENTRY
debut	MVN		r0,#11; A (dividende)
		MVN		r1,#3; B (diviseur)
		MOV 	r2,#1; A/B (quotient)
		MOV		r3,#1; (reste)
		MOV 	r4,#0; booleen si resultat � besoin d'�tre chang� en negatif( 0 = non, 1 = oui )
		
	    CMP 	r0,#0;  
	    CMPEQ	r1,#0; 
        BGE 	bouclI; a et b POSITIF resultat positif ( pas besoin d'�tre chang� )
        
	    CMP		r0,#0; if ( r0<0 ) 
	    CMPEQ	r1,#0; if ( r1<0 )
		MVNLT	r0,r0; On passe A de n�gatif � positif 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
		MVNLT	r1,r1; On passe B de n�gatif � positif 
		ADDLT	r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
        BLT 	bouclI; a et b negatif resultat positif ( pas besoin d'�tre chang� )
        
        
       	CMP		r0,#0; 
       	MOV		r4,#1; A < 0 alors le r�sultat sera n�gatif ( on modifie le bool�en )
		MVN		r1,r1; On passe B de n�gatif � positif ( n�c�ssaire pour le nombre d'it�ration ) 
       	MVNLT	r0,r0; A < 0 On passe A de n�gatif � positif 
		ADDLT	r0,r0,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
       	BLT 	bouclI; Si A < 0 le r�sultat sera d�j� en n�gatif donc pas besoin de changer le signe
        
        MOV		r4,#1; B < 0 alors le r�sultat sera en positif mais il a besoin d'�tre changer en n�gatif ( on modifie le bool�en )
		MVN		r1,r1; On passe B de n�gatif � positif ( n�c�ssaire pour le nombre d'it�ration ) 
		ADD		r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

bouclI  MOV		r5,r0; initialisation de temp A		
boucl	CMP		r5,r1; tant que Temp A > B
		BLE		endB;  
		SUB		r5,r5,r1; on d�duit temp A au r�sultat ( on va le faire B fois, ainsi on va faire A / B )
		ADD 	r2,r2,#1; on incr�mente notre compteur d'it�ration
		B		boucl;    

endB	SUB		r3,r1,r5; on calcul le reste
		MOVEQ	r4,#0; if(r4==0); on regarde si on a besoin de modifier notre r�sultat
		BEQ		fin; non pas besoin
		MVN 	r2,r2; on passe notre r�sultat en n�gatif
		ADD 	r2,r2,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

fin		SWI		0x123456;
		END  