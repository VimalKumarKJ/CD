%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

extern int yylex();
extern char* yytext;
extern int yylval;
extern FILE* yyin;

void yyerror(const char* message);

bool isValidDataType(const char* dataType);

%}

%token INT FLOAT DOUBLE CHAR BOOL IF ELSE NUMBER IDENTIFIER

%%

program : statement
        | program statement
        ;

statement : declaration ';'
          | IF '(' condition ')' '{' program '}' ELSE '{' program '}'
          ;

declaration : dataType variable
            ;

dataType : INT
         | FLOAT
         | DOUBLE
         | CHAR
         | BOOL
         ;

variable : IDENTIFIER
         ;

condition : expression
          ;

expression : NUMBER
           | IDENTIFIER
           ;

%%

void yyerror(const char* message) {
    printf("Error: %s\n", message);
    exit(1);
}

int main() {
    yyin = stdin;
    yyparse();
    return 0;
}
