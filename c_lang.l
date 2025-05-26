%{
#include <stdio.h>
#include <string.h>

void print_token(const char* type, const char* subtype, const char* value) {
    if (subtype && strlen(subtype) > 0)
        printf("%s (%s): %s\n", type, subtype, value);
    else
        printf("%s: %s\n", type, value);
}

int yywrap(void) { return 1; }
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"  { print_token("KEYWORD", "", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*    { print_token("IDENTIFIER", "", yytext); }

[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?  { print_token("LITERAL", "float", yytext); }
[0-9]+([eE][+-]?[0-9]+)?          { print_token("LITERAL", "integer", yytext); }
\"([^\\"]|\.)*\"    { print_token("LITERAL", "string", yytext); }
\'([^\\']|\.)*\'      { print_token("LITERAL", "char", yytext); }

"//"([^\n]|\.)*        { print_token("COMMENT", "", yytext); }

"=="|"!="|"<"|">"|"<="|">="    { print_token("OPERATOR", "relational", yytext); }
"&&"|"||"|"!"             { print_token("OPERATOR", "logical", yytext); }
("&"|"|"|"^"|"~"|"<<"|">>") { print_token("OPERATOR", "bitwise", yytext); }
("++"|"--")                  { print_token("OPERATOR", "increment/decrement", yytext); }
("->")                        { print_token("OPERATOR", "pointer", yytext); }
("="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^=") { print_token("OPERATOR", "assignment", yytext); }
("+"|"-"|"*"|"/"|"%"|"~")   { print_token("OPERATOR", "arithmetic", yytext); }

[(){}\[\],;:.?]   { print_token("SYMBOL", "", yytext); }

"#"([a-zA-Z_][a-zA-Z0-9_]*|\s+)*  { print_token("PREPROCESSOR", "", yytext); }

[ \t\r\n]+    { }

\[abfnrtv\'\"?]         { print_token("ESCAPE_SEQUENCE", "", yytext); }

.   { printf("ERROR: Unrecognized token '%s'\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}