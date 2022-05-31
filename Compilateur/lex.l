%{
/* Déclaration des variables */
/* et des symboles appelés constantes littérales */
/* #include... */
#include "y.tab.h"
%}

%option noyywrap
/* Déclarations des classes et des expressions régulières */

%%

printf {return tPRINTF;}
return {return tRETURN;}
if {return tIF;}
else {return tELSE;}
while {return tWHILE;}

int {return tINT;}
const {return tCONST;}
[0-9]+(e[0-9]+)? {
    yylval.nb = (int) strtold(yytext, NULL);
    return tNB;
    }
    
[a-z]([a-zA-Z]|_|[0-9])* {
    strcpy(yylval.str, yytext);
    return tID;
    }

"+" {return tADD;}
"-" {return tMIN;}
"*" {return tMUL;}
"/" {return tDIV;}
"=" {return tEQU;}
">" {return tSUP;}
"<" {return tINF;}

";" {return tSEM;}
"(" {return tPAROPEN;}
")" {return tPARCLOSE;}
"{" {return tBRAOPEN;}
"}" {return tBRACLOSE;}
"," {return tCOMMA;}
"\"" {return tQUOTE;}
[ \t\n]+  {} 
