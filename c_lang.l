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
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Alignas"|"_Alignof"|"_Atomic"|"_Bool"|"_Complex"|"_Generic"|"_Imaginary"|"_Noreturn"|"_Static_assert"|"_Thread_local"  { print_token("KEYWORD", "", yytext); }

"stdio.h"|"stdlib.h"|"string.h"|"math.h"|"ctype.h"|"stdbool.h"|"limits.h"|"float.h"|"time.h"|"assert.h"|"errno.h"|"stddef.h"|"stdint.h"|"signal.h"|"locale.h"|"setjmp.h"|"complex.h"|"iso646.h"|"wchar.h"|"wctype.h"|"tgmath.h"|"threads.h"|"uchar.h"|"fenv.h"      { print_token("IDENTIFIER", "header", yytext); }

"#define"|"#undef"|"#include"|"#if"|"#ifdef"|"#ifndef"|"#else"|"#elif"|"#endif"|"#error"|"#pragma"|"#line"  { print_token("PREPROCESSOR", "", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*    { print_token("IDENTIFIER", "", yytext); }

[0-9]+\.[0-9]+([eE][+-]?[0-9]+)?  { print_token("LITERAL", "float", yytext); }
[0-9]+          { print_token("LITERAL", "integer", yytext); }
\"([^\\\n]|(\\.))*\"    { print_token("LITERAL", "string", yytext); }
\'([^\\\n]|(\\.))*\'      { print_token("LITERAL", "char", yytext); }

"//"([^\n])*        { print_token("COMMENT", "", yytext); }

"=="|"!="|"<"|">"|"<="|">="    { print_token("OPERATOR", "relational", yytext); }
"&&"|"||"|"!"             { print_token("OPERATOR", "logical", yytext); }
("&"|"|"|"^"|"~"|"<<"|">>") { print_token("OPERATOR", "bitwise", yytext); }
("++"|"--")                  { print_token("OPERATOR", "increment/decrement", yytext); }
("->")                        { print_token("OPERATOR", "pointer", yytext); }
("="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^=") { print_token("OPERATOR", "assignment", yytext); }
("+"|"-"|"*"|"/"|"%"|"~")   { print_token("OPERATOR", "arithmetic", yytext); }
"?"             { print_token("OPERATOR", "ternary", yytext); }

"."|"::"|"->"|"..."   { print_token("PUNCTUATOR", "", yytext); }

[()\[\]{},:;]   { print_token("DELIMITER", "", yytext); }

[ \t\r\n]+    { /* Ignore whitespaces and newlines */ }

.   { printf("ERROR: Unrecognized token: '%s'\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}