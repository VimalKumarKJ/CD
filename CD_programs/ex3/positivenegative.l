%option noyywrap
%{
    #include <stdio.h>
%}
%%
[+][0-9]* {printf("Positive Number");}
[-][0-9]* {printf("Negative Number");}
\n {return 0;}
%%
int main(){
    printf("Enter a number:");
    yylex();
}