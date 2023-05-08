%option noyywrap
%{
    #include <stdio.h>
}
%%
[0-9]+[+-*/][0-9]+ {printf("valid");}
. {printf("Invalid");}
\n {return 0;}
%%
int main(){
    printf("Enter an arithmetic expression: ");
    yylex();
}