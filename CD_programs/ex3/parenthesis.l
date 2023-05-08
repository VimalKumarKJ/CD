%option noyywrap
%{
    #include <stdio.h>
    int stack = 0, i = 0, j = 0, k = 0;
%}
%%
[[] {stack++; i++;}
[{] {stack++; j++;}
[(] {stack++; k++;}
[]] {stack--;}
[}] {stack--;}
[)] {stack--;}
\n {return 0;}
%%
int main(){
    printf("Enter parenthesis: ");
    yylex();
    printf("square brackets: %d\n", i);
    printf("curly braces: %d\n", j);
    printf("curly brackets: %d\n", k);
}