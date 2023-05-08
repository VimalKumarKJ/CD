%option noyywrap
%{
    #include <stdio.h>
%}
%%
[0-9]* {printf("digit");}
[a-zA-Z]* {printf("word");}
[0-9a-zA-Z]* {printf("neither digit or word");}
\n {return 0;} 
%%
int main(){
    printf("Enter the string: ");
    yylex();
}