%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

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

statement : declaration ';' { printf("Declaration: %s\n", $<identifier>2); }
          | IF '(' condition ')' '{' program '}' ELSE '{' program '}' { printf("If-Else statement\n"); }
          ;

declaration : dataType variable { printf("Variable declaration: %s\n", $<identifier>2); }
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

bool isValidDataType(const char* dataType) {
    return strcmp(dataType, "INT") == 0 ||
           strcmp(dataType, "FLOAT") == 0 ||
           strcmp(dataType, "DOUBLE") == 0 ||
           strcmp(dataType, "CHAR") == 0 ||
           strcmp(dataType, "BOOL") == 0;
}

void yyerror(const char* message) {
    printf("Error: %s\n", message);
    exit(1);
}

int main() {
    yyin = stdin;
    yyparse();
    return 0;
}
