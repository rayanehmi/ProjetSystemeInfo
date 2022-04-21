%{
#include <stdlib.h>
#include <stdio.h>
#include "code.h"
#include "symbolTable.h"
int var[26];
int yylex();
void yyerror(char *s);
%}

%union { int nb ; char str[16]; }
%token tINT tCONST tADD tMIN tMUL tDIV tEQU tSEM tPAROPEN
%token tPARCLOSE tBRAOPEN tBRACLOSE tMAIN tRETURN tIF tELSE tWHILE
%token tCOMMA tQUOTE tPRINTF tSUP tINF
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
  tINT tID tPAROPEN Vars tPARCLOSE Bloc;

Bloc:
  tBRAOPEN Content tBRACLOSE
 |tBRAOPEN Content tRETURN Valeur tBRACLOSE; 
 
Vars: | tINT tID VarsNext {
  add_symbol($2,"int");
  }

VarsNext: | tCOMMA tINT tID VarsNext ;

    /* Lignes */

Content: 
  Affectation Content 
| Declaration Content 
| Printf Content
| Condition 
| ConditionWhile
| ;

Declaration: tINT tID tEQU {add_symbol($2,"int");printf("xxxxxx\n"); print_ts();} Valeur tSEM {
  int Temp = derniere();
  freeVar(); 
  add_inst3(COP,getAddr($2),Temp);
  }

Affectation: tID tEQU Valeur tSEM {
  int Temp = derniere();
  freeVar();
  add_inst3(COP,getAddr($1),Temp);
  }


  /* Valeur & Calculs */

Valeur: 
  Valeur tADD Valeur {add_arit(ADD, avant_derniere(), avant_derniere(),derniere());} 
| Valeur tMIN Valeur  {add_arit(MIN, avant_derniere(), avant_derniere(),derniere());} 
| Valeur tDIV Valeur {add_arit(DIV, avant_derniere(), avant_derniere(),derniere());}
| Valeur tMUL Valeur {add_arit(MUL, avant_derniere(), avant_derniere(),derniere());}
| tNB  {addTmp();
        // on utilise l index du mauvais tableau 
        add_inst3(AFC,derniere(),$1);
      }
| tID  {int add = addTmp();
        add_inst3(AFC,add,derniere());
       }
| tPAROPEN Valeur tPARCLOSE ;

    /* Printf */

Printf: 
  tPRINTF tPAROPEN tID tPARCLOSE tSEM { add_inst2(PRI, getAddr($3)); } 
/*| tPRINTF tPAROPEN tQUOTE tQUOTE tPARCLOSE tSEM { printf(""); } */

    /* If & Else */


Condition: 
  tIF tPAROPEN Expression tPARCLOSE 
  {
    // int ligne = add_inst(JMPF);
    
  } 
  
  Bloc 
  {
    // int current = get_nb_lignes_asm();
  }
  Else Content {
    incrDepth();
      //?
    decrDepth();
    } 

Else: | 
  tELSE Bloc {
    incrDepth();
      //?
    decrDepth();
  } 

Expression: Valeur Comparaison Valeur | Valeur;

Comparaison: tINF | tSUP | tINF tEQU | tSUP tEQU | tEQU tEQU;

    /* While */

ConditionWhile: 
  tWHILE tPAROPEN Expression tPARCLOSE Bloc Content
| tWHILE tPAROPEN Expression tPARCLOSE tSEM Content;

%%


void yyerror(char *s) {
    fprintf(stderr, "%s", s);
    exit(1);
}