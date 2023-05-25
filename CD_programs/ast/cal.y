%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int value;
    struct ast_node* node;
}

%token <value> NUMBER

%type <node> expr term factor

%left '+' '-'
%left '*' '/'

%%

program: expr { printf("Result: %d\n", $1->value); }

expr: expr '+' term    { $$.node = create_binary_node('+', $1->node, $3->node); }
    | expr '-' term    { $$.node = create_binary_node('-', $1->node, $3->node); }
    | term             { $$.node = $1->node; }

term: term '*' factor  { $$.node = create_binary_node('*', $1->node, $3->node); }
    | term '/' factor  { $$.node = create_binary_node('/', $1->node, $3->node); }
    | factor           { $$.node = $1->node; }

factor: NUMBER        { $$.node = create_leaf_node($1->value); }
      | '(' expr ')'  { $$.node = $2->node; }

%%

#include <stdio.h>
#include <stdlib.h>

struct ast_node {
    char op;
    int value;
    struct ast_node* left;
    struct ast_node* right;
};

int yylex();
void yyerror(const char* message);

struct ast_node* create_leaf_node(int value) {
    struct ast_node* node = malloc(sizeof(struct ast_node));
    node->op = '\0';
    node->value = value;
    node->left = NULL;
    node->right = NULL;
    return node;
}

struct ast_node* create_binary_node(char op, struct ast_node* left, struct ast_node* right) {
    struct ast_node* node = malloc(sizeof(struct ast_node));
    node->op = op;
    node->value = 0;
    node->left = left;
    node->right = right;
    return node;
}

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* message) {
    printf("Error: %s\n", message);
    exit(1);
}