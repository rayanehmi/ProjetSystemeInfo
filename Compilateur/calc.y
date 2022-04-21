%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}

%token tINT tCONST tNB tID tADD tMIN tMUL tDIV tEQU tSEM tPAROPEN
%token tPARCLOSE tBRAOPEN tBRACLOSE tMAIN tRETURN tIF tELSE tWHILE
%token tSPACE tCOMMA tTAB tBREAK tQUOTE tSUICIDE
%start Programme
%%

Programme : Funs;
Funs : Fun | Fun Funs ;
Fun : tINT tID tPAROPEN Vars tPARCLOSE RetourLigne tBRAOPEN RetourLigne Content tBRACLOSE
RetourLigne : tBREAK | tBREAK RetourLigne | ;

Espace : Espace " " | Espace | ;

Opp : Add|Adds

Vars : tINT tID | tINT tID Vars | ;
Content : 


tINT tID tSEM
    {mem[$2]=$3;}

Operations : Affectation Operation;
Valeur : Operation | tNB;
Affectation : tID tEQU Valeur {6 $1 $3}

Operation : Operande Valeur Operation | Operande Valeur;
Operande : tADD | tMUL | tDIV | tMIN;

Valeur : tNB | tID;


tPRINTF tSEM
    {print }