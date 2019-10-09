Digito			[ 0-9 ]
Letra			[ a-zA-Z_ ]
OperadorBinario [ + - * / ]
OperadorUnario  [ - ]
CaracterEscapado [ \n ]
Entero {Digito}+
Alfanumerico {Digito} | {Letra}
Variable {Letra} | {Letra}({Alfanumerico})
CaracterImprimible [\40-\176]
Caracter {CaracterEscapado}|{CaracterImprimible}
Texto {caracter}+
 
%{
#include <stdio.h>
%}

%%
{Digito}+ {printf("Entero %s (%d) \n", yylex,atoi(yytext));}
{Letra}+ {printf("palabra %s (%c) \n", yylex,yytext);}
{OperadorBinario}|{OperadorBinario} {printf("Operador %s (%c) \n", yylex,yytext);}
{Variable} {printf("Variable %s (%c) \n", yylex,yytext);}
%%


main(){yylex();}