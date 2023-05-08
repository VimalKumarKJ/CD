%option noyywrap
%{
    #include <stdio.h>
    int lines = 0, numbers = 0, characters = 0, words = 0, symbols = 0;
%}

%%
[\n] {lines++;}
[0-9] {numbers++;}
[a-zA-Z] {characters++;}
[' '] {words++;} 
. {symbols++;}
\n {return 0;}
%%
int main(){
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Lines: %d\n", lines);
    printf("Numbers: %d\n", numbers);
    printf("Characters: %d\n", characters);
    printf("Words: %d\n", words);
    printf("Symbols : %d\n", symbols); 
}