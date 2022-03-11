%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}

%union { int nb ; char str[16]; }
%token tINT tCONST tADD tMIN tMUL tDIV tEQU tSEM tPAROPEN
%token tPARCLOSE tBRAOPEN tBRACLOSE tMAIN tRETURN tIF tELSE tWHILE
%token tSPACE tCOMMA tTAB tBREAK tQUOTE tPRINTF
%token <nb> tNB
%token <str> tID

%left tADD tMIN
%left tMUL tDIV

%start Programme
%%

Programme : Funs;
Funs : Fun | Fun Funs ;
Fun : tINT tID tPAROPEN Vars tPARCLOSE tBRAOPEN Content tBRACLOSE;

Vars : | tINT tID VarsNext ;

VarsNext : | tCOMMA tINT tID VarsNext ;


Content : Affectation Content | ;
Affectation : tID tEQU Valeur tSEM ;
Valeur : Valeur tADD Valeur
| Valeur tMUL Valeur
| tNB
| tID
| tPAROPEN Valeur tPARCLOSE ;


%%


void yyerror(char *s) {
    fprintf(stderr, "%s", s);
    exit(1);
}