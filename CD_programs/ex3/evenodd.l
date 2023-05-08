%option noyywrap
%{
    #include <stdio.h>
%}

%%
[0-9]*[02468] {printf("Even number")}
[0-9]*[13579] {printf("Odd number")}
\n {return 0;}
%%
int main(){
    printf("Enter the number");
    yylex();
}

