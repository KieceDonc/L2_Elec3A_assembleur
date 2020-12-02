        AREA    StrCopy, CODE, READONLY 

        ENTRY                     

start	MOV 	r0,#4; taille du tableau  
		LDR 	r1,=src; adresse du tableau source
		MOV		r2,#0; nombre d'iteration de la boucle
		MOV		r3,#0; variable temporaire ( contient l'indice du tableau )
		MOV 	r4,#0; variable temporaire ( stock la valeur du tableau src à l'indice de r3 )
		LDR		r5,=dst;
        BL      boucl          

stop 

        MOV     r0, #0x18         
        LDR     r1, =0x20026      
        SWI     0x123456          

boucl	CMP		r2,r0; 
		BEQ		inits;  boucle tant que r2 != r0
		SUB		r3,r0,r2; on calcul l'indice voulu
		SUB		r3,r3,#1;
		LDRB	r4,[r1,r3]; on charge la valeur à l'indice voulu ( r0-r2 ) dans le tableau src 
		STRB	r4,[r5,r2]; on affecte la valeur de r3 dans le tableau dst à l'indice r2
		ADD 	r2,r2,#1; on incrémente le compteur d'itération
		B		boucl;   

inits	MOV		r2,#0; on remet le compteur d'itération à 1 pour parcourir le tableau	
show	CMP 	r2,r0; on compare r0 et r2
		BGE 	stop; si r0 == r2 alors on s'arrête, sinon
		LDRB 	r4,[r5,r2]; on charge la valeur de la variable contenu dans le tableau dst à l'indice r2
		ADD 	r2,r2,#1; on incrémente le compteur d'itération
		B 		show; 	

        AREA    Strings, DATA, READWRITE 

src  DCB "Lul",0 
dst  DCB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;


