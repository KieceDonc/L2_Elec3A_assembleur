		AREA TP2, CODE, READONLY;
		ENTRY
debut	MVN		r0,#10; A ( ici -11 )
		MOV		r1,#3; B ( ici -4 )
		MOV 	r2,#0; A*B resultat
		MOV		r3,#1; nombre d'iteration
		MOV 	r4,#0; booleen si resultat � besoin d'�tre chang� en negatif( 0 = non, 1 = oui )
		
		CMP		r0,#0
		CMPEQ	r1,#0
        BGT 	boucl; a et b POSITIF resultat positif ( pas besoin d'�tre chang� ) donc on va faire la multiplication dans boucl
        
	    CMP	    r0,#0;
	    CMPEQ	r1,#0; 
        BLT 	boucl; a et b negatif resultat positif ( pas besoin d'�tre chang� ) donc on va faire la multiplication dans boucl
        
       	CMP		r0,#0; 
       	BLT 	boucl; Si A < 0 le r�sultat sera d�j� en n�gatif donc pas besoin de changer le signe
        
        MOV		r4,#1; B < 0 alors le r�sultat sera en positif mais il a besoin d'�tre changer en n�gatif ( on modifie le bool�en )
		MVN		r1,r1; On passe B de n�gatif � positif ( n�c�ssaire pour le nombre d'it�ration ) 
		ADD		r1,r1,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1
		
boucl	CMP		r3,r1; tant que r3 ( nombre d'it�ration ) est diff�rent de B, on fait une it�ration
		BHI		endB;  
		ADD		r2,r2,r0; on ajoute A au r�sultat ( on va le faire B fois, ainsi on va faire A * B )
		ADD 	r3,r3,#1; on incr�mente notre compteur d'it�ration
		B		boucl;    

endB	CMP 	r4,#0; if(r4==0); on regarde si on a besoin de modifier notre r�sultat
		BEQ		fin; non pas besoin
		MVN 	r2,r2; on passe notre r�sultat en n�gatif
		ADD 	r2,r2,#1; on ajoute 1 car MVN fait le compl�ment � deux mais n'ajoute pas 1

fin		SWI		0x123456;
		END  