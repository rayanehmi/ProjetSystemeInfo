%{
/* Déclaration des variables */
/* et des symboles appelés constantes littérales */
/* #include... */
%}
/* Déclarations des classes et des expressions régulières */
...
%%
/* Règles de traduction */
int {return tINT;}
[0-9]+ {return tNB;}
[a-Z]+ {return tID;}

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

main {return tMAIN;}
return {return tRETURN;}
if {return tIF;}
else {return tELSE;}
while {return tWHILE;}


%%
/* mi est une expression régulière */
/* actioni est une action lorsque le lexème correspond à mi*/
/* Procédures auxiliaires en C utiles dans les actions
et/ou permettant de faire un programme indépendant */