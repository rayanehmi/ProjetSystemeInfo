%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}

%union { int nb ; char str[16]; }
%token tINT tCONST tADD tMIN tMUL tDIV tEQU tSEM tPAROPEN tEXP
%token tPARCLOSE tBRAOPEN tBRACLOSE tMAIN tRETURN tIF tELSE tWHILE
%token tSPACE tCOMMA tTAB tBREAK tQUOTE tPRINTF tSUP tINF
%token <nb> tNB
%token <str> tID

%left tADD tMIN
%left tMUL tDIV

%start Programme
%%

    /* Programme & Fonctions & Variables */

Programme: Funs;
Funs: Fun | Fun Funs ;
Fun: 
  tINT tID tPAROPEN Vars tPARCLOSE tBRAOPEN Content tBRACLOSE
| tINT tID tPAROPEN Vars tPARCLOSE tBRAOPEN Content tRETURN Valeur tBRACLOSE;

Vars: | tINT tID VarsNext ;

VarsNext: | tCOMMA tINT tID VarsNext ;

    /* Lignes */

Content: 
  Affectation Content 
| tINT Affectation Content 
| Printf Content
| Condition 
| ConditionWhile
| ;

Affectation: tID tEQU Valeur tSEM ;

    /* Valeur & Calculs */

Valeur: 
  Valeur tADD Valeur
| Valeur tEXP Valeur
| Valeur tMIN Valeur
| Valeur tDIV Valeur
| Valeur tMUL Valeur
| tNB
| tID
| tPAROPEN Valeur tPARCLOSE ;

    /* Printf */

Printf: 
  tPRINTF tPAROPEN tID tPARCLOSE tSEM  
| tPRINTF tPAROPEN tQUOTE tQUOTE tPARCLOSE tSEM;

    /* If & Else */

Condition: 
  tIF tPAROPEN Expression tPARCLOSE tBRAOPEN Content tBRACLOSE Else Content;

Else: | 
  tELSE tBRAOPEN Content tBRACLOSE;

Expression: Valeur Comparaison Valeur | Valeur;

Comparaison: tINF | tSUP | tINF tEQU | tSUP tEQU | tEQU tEQU;

    /* While */

ConditionWhile: 
  tWHILE tPAROPEN Expression tPARCLOSE tBRAOPEN Content tBRACLOSE Content
| tWHILE tPAROPEN Expression tPARCLOSE tSEM Content;

%%


void yyerror(char *s) {
    fprintf(stderr, "%s", s);
    exit(1);
}