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
"abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extends"|"final"|"finally"|"float"|"for"|"goto"|"if"|"implements"|"import"|"instanceof"|"int"|"interface"|"long"|"native"|"new"|"package"|"private"|"protected"|"public"|"return"|"short"|"static"|"strictfp"|"super"|"switch"|"synchronized"|"this"|"throw"|"throws"|"transient"|"try"|"void"|"volatile"|"while"  { print_token("KEYWORD", "", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*    { print_token("IDENTIFIER", "", yytext); }

[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?[fF]?  { print_token("LITERAL", "float", yytext); }
[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?[dD]?  { print_token("LITERAL", "double", yytext); }
[0-9]+          { print_token("LITERAL", "integer", yytext); }
\"([^\"\\\n]|\\[btnfr\"\'\\])*\"    { print_token("LITERAL", "string", yytext); }
\'([^\\'\n]|\\[btnfr\"\'\\])\'      { print_token("LITERAL", "char", yytext); }

"//"([^\n])*        { print_token("COMMENT", "", yytext); }

"=="|"!="|"<"|">"|"<="|">="    { print_token("OPERATOR", "relational", yytext); }
"&&"|"||"|"!"             { print_token("OPERATOR", "logical", yytext); }
"<<"|">>"|">>>"|"&"|"|"|"^"|"~" { print_token("OPERATOR", "bitwise", yytext); }
"++"|"--"                  { print_token("OPERATOR", "increment/decrement", yytext); }
"="|"+="|"-="|"*="|"/="|"%="|"&="|"\\|="|"^=" { print_token("OPERATOR", "assignment", yytext); }
"+"|"-"|"*"|"/"|"%"       { print_token("OPERATOR", "arithmetic", yytext); }
"?"             { print_token("OPERATOR", "ternary", yytext); }

"."|"->"   { print_token("PUNCTUATOR", "", yytext); }

[()\[\]{},:;]   { print_token("DELIMITER", "", yytext); }

"#"([a-zA-Z_][a-zA-Z0-9_]*|\s+)*  { print_token("PREPROCESSOR", "", yytext); }

[ \t\r\n]+    { /* Ignore whitespaces and newlines */ }

.   { printf("ERROR: Unrecognized token '%s'\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
