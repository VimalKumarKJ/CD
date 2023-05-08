%option noyywrap
%{
    #include <stdio.h>
    int v = 0, c = 0;
%}
%%
[aeiouAEIOU] {v++;}
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] {c++;}
\n {return 0;}
%%
int main(){
    printf("Enter a string");
    yylex();
    printf("The number of vowels: %d\n", v);
    printf("The number of consonents: %d\n", c);
}