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
%token tPARCLOSE tBRAOPEN tBRACLOSE tMAIN tRETURN tELSE 
%token tCOMMA tQUOTE tPRINTF tSUP tINF
%token <nb> tNB
%token <nb> tIF
%token <nb> tWHILE
%token <str> tID

%left tADD tMIN
%left tMUL tDIV

%start Programme
%%

    /* Programme & Fonctions & Variables */

Programme: Consts Funs;
Consts: | Const | Const Consts
Const: tCONST tID Valeur 
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
| tINT Declaration Content 
| Printf Content
| Condition Content 
| ConditionWhile Content 
| ;

Declaration: tID tEQU {add_symbol($1,"int");printf("xxxxxx\n"); print_ts();} Valeur tSEM {
  int Temp = derniere();
  freeVar(); 
  add_inst3(COP,getAddr($1),Temp);
  }
  | tID  {int add = addTmp();
        add_inst3(AFC,add,getAddr($1));
       } tSEM
  | tID {int add = addTmp();
        add_inst3(AFC,add,getAddr($1));
       } tCOMMA Declaration
  |tID tEQU {add_symbol($1,"int");printf("xxxxxx\n"); print_ts();} Valeur {
  int Temp = derniere();
  freeVar(); 
  add_inst3(COP,getAddr($1),Temp);
  } tCOMMA Declaration


Affectation: tID tEQU Valeur tSEM {
  int Temp = derniere();
  freeVar();
  add_inst3(COP,getAddr($1),Temp);
  }


  /* Valeur & Calculs */

Valeur: 
  Valeur tADD Valeur { add_arit(ADD, avant_derniere(), avant_derniere(),derniere());} 
| Valeur tMIN Valeur  {add_arit(MIN, avant_derniere(), avant_derniere(),derniere());} 
| Valeur tDIV Valeur {add_arit(DIV, avant_derniere(), avant_derniere(),derniere());}
| Valeur tMUL Valeur {add_arit(MUL, avant_derniere(), avant_derniere(),derniere());}
| tNB  {addTmp();
        // on utilise l index du mauvais tableau 
        add_inst3(AFC,derniere(),$1);
      }
| tID  {int add = addTmp();
        add_inst3(AFC,add,getAddr($1));
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
    add_inst2(JMF,derniere());
    int ligne = get_nb_lignes_asm();
    $1 = ligne;
  } 
  
  Bloc 
  {
    int current = get_nb_lignes_asm();
    patchJMF($1,current+2);
    add_inst(JMP);
    int ligne = get_nb_lignes_asm();
    $1 = ligne;
    }
  tELSE Bloc {
    int current = get_nb_lignes_asm();
    patchJMP($1, current+1);
    } 

Expression: 
Valeur tINF Valeur {add_arit(INF, avant_derniere(), avant_derniere(),derniere());} 
|Valeur tSUP Valeur {add_arit(SUP, avant_derniere(), avant_derniere(),derniere());}
|Valeur tEQU tEQU Valeur {add_arit(EQU, avant_derniere(), avant_derniere(),derniere());}  
|Valeur tINF tEQU Valeur {add_arit(INF, avant_derniere(), avant_derniere(),derniere()+1);}
|Valeur tSUP tEQU Valeur {add_arit(SUP, avant_derniere(), avant_derniere(),derniere()-1);}
|Valeur;

    /* While */

ConditionWhile: 
  tWHILE tPAROPEN Expression tPARCLOSE
  {
    add_inst2(JMF,derniere());
    int ligne = get_nb_lignes_asm();
    $1 = ligne;
  }
   Bloc 
  {
    int current = get_nb_lignes_asm();
    patchJMF($1, current+2);
    add_inst2(JMP,$1-1);
  } 

%%


void yyerror(char *s) {
    fprintf(stderr, "%s", s);
    exit(1);
}
