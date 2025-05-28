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
"False"|"None"|"True"|"as"|"assert"|"async"|"await"|"break"|"class"|"continue"|"def"|"del"|"elif"|"else"|"except"|"finally"|"for"|"from"|"global"|"if"|"import"|"lambda"|"nonlocal"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield"      { print_token("KEYWORD", "", yytext); }

"and"|"or"|"not"|"in"|"is"      { print_token("OPERATOR", "logical", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*    { print_token("IDENTIFIER", "", yytext); }

([0-9]+(\.[0-9]*)?|\.[0-9]+)([eE][+-]?[0-9]+)?|0[bB][01_]+|0[oO][0-7_]+|0[xX][0-9a-fA-F_]+|[0-9][0-9_]*|([0-9]+|([0-9]*\.[0-9]+)|([0-9]+\.[0-9]*))[jJ]           { print_token("LITERAL", "number", yytext); }
\"([^\\"]|\.)*\"|\'([^\\"]|\.)*\'    { print_token("LITERAL", "string", yytext); }

"#"[^\n]*        { print_token("COMMENT", "", yytext); }

"=="|"!="|"<"|">"|"<="|">="    { print_token("OPERATOR", "relational", yytext); }
"&"|"\|"|"^"|"~"|"<<"|">>" { print_token("OPERATOR", "bitwise", yytext); }
"**"|"+"|"-"|"*"|"/"|"%"|"//"   { print_token("OPERATOR", "arithmetic", yytext); }
"="|"+="|"-="|"*="|"/="|"%="|"//="|"**="|"&="|"|="|"^="|">>="|"<<="  { print_token("OPERATOR", "assignment", yytext); }
"?"             { print_token("OPERATOR", "ternary", yytext); }

"."|"..."     { print_token("PUNCTUATOR", "", yytext); }

[(){}\[\],;:]   { print_token("DELIMITER", "", yytext); }

[ \t\r\n]+    { /* Ignore whitespaces and newlines */ }

.   { printf("ERROR: Unrecognized token: '%s'\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
