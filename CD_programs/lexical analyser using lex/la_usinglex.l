%option noyywrap
%option yylineno
%{
    #include <stdio.h>
    int l = 1;
%}
%%
#.* {printf("\nline:%d\tpreprocessor:%s", yylineno, yytext);}
[a-zA-Z_][a-zA-Z0-9_]*\( {printf("\nline:%d\tfunction:%s")}
("int")|("float")|("void")|("double")|("return") {printf("\nline:%d\tkeyword:%s", yylineno, yytext);}
[a-zA-Z][a-zA-Z0-9_] {printf("\nline:%d\tidentifiers:%s"yylineno, yytext);}
[0-9] {printf("\nline:%d\tliterals:%s", yylineno, yytext);}
[{,;}] {printf("\nline:%d\tdelimiters:%s", yylineno, yytext);}
"+"|"-"|"*"|"/" {printf("\nline:%d\toperators:%s", yylineno, yytext);}
\n {l++;}
%%
int main(){
    yyin = fopen("sample.txt", "r");
    yylex();
}