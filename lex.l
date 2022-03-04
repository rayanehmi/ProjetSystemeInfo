%{
/* Déclaration des variables */
/* et des symboles appelés constantes littérales */
/* #include... */
%}
/* Déclarations des classes et des expressions régulières */

%%

main {printf("Main detecte");}
printf {return tPRINTF;}
return {return tRETURN;}
if {return tIF;}
else {return tELSE;}
while {return tWHILE;}

int {return tINT;}
const {return tCONST;}
[0-9]+ {return tNB;}
[A-z]([A-z]|_|[0-9])* {return tID;}

"+" {return tADD;}
"-" {return tMIN;}
"*" {return tMUL;}
"/" {return tDIV;}
"=" {return tEQU;}

";" {return tSEM;}
"(" {return tPAROPEN;}
")" {return tPARCLOSE;}
"{" {return tBRAOPEN;}
"}" {return tBRACLOSE;}
" " {return tSPACE;}
"," {return tCOMMA;}
"\t" {return tTAB;}
"\n" {return tBREAK;}
"\"" {return tQUOTE;}
[ \t]+ {return ;} /* big coup de genie de paul */
%%
/* mi est une expression régulière */
/* actioni est une action lorsque le lexème correspond à mi*/
/* Procédures auxiliaires en C utiles dans les actions
et/ou permettant de faire un programme indépendant */