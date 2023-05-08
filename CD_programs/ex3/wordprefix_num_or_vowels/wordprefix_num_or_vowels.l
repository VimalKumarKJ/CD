%option noyywrap
%{
    #include <stdio.h>
    int numerical = 0, vowels = 0; 
%}
%%
[0-9][a-zA-Z0-9]*[\n" "]* {numerical++;}
[aeiouAEIOU][a-zA-Z0-9]*[\n" "]* {vowels++;}
\n {return 0;}
%%
int main(){
    yyin = fopen("");
    yylex();
    printf("vowels: %d\n", vowels);
    printf("numericals: %d\n", numerical);
}
