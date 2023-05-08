%option noyywrap
%{
    #include <stdio.h>
    void calculator();
    int option = 0;
    float a, b;
%}
%%
[0-9]+|([0-9]*)'.'[0-9]+ {calculator();}
"+" {option = 1;}
"-" {option = 2;}
"*" {option = 3;}
"/" {option = 4;}
\n {printf("Answer: %.2f", a); return 0;}
%%
int main(){
    printf("enter exp: ");
    yylex();
}

void calculator(){
    a = atof(yytext);
    b = atof(yytext);
    switch(options){
        case 1: a = a+b; break;
        case 2: a = a-b; break;
        case 3: a = a*b; break;
        case 4: if (b != 0){a = a/b;}
        else{printf("divide by zero")} break;
    }
}


