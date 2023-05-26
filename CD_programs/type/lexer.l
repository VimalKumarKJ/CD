%{
#include "y.tab.h"
%}

%%

int                     return INT;                 
float                   return FLOAT;
double                  return DOUBLE;
char                    return CHAR;
bool                    return BOOL;
if                      return IF;
else                    return ELSE;
[0-9]+                  {yylval.value = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*    { yylval.identifier = strdup(yytext); return IDENTIFIER; }
[ \t\n]                 /* Skip whitespace */

.                       return yytext[0];

%%

int yywrap() {
    return 1;
}