%option noyywrap
%{
    #include <stdio.h>
%}
%%
[a-zA-Z][0-9a-zA-Z]* {printf("Valid");}
.* {printf("Invalid");}
\n {return 0;}
%%
int main(){
    printf("Enter the identifier");
    yylex;
}