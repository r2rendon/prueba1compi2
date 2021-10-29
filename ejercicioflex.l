%option noyywrap
%option yylineno

%{
    #include "tokens.h"
    extern int yylval;
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
">" { return GREATERTHAN; }
"<" { return LESSTHAN; }
">=" { return GREATEROREQUALTHAN; }
"<=" { return LESSOREQUALTHAN; }
"==" { return ASSIGN; }
"true" { return TRUEKW; }
"false" { return FALSEKW; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[\n] { return EOL; }
[ \t] { /* ignorar */ }
. { printf("invalido %c\n", yytext[0]); }
%%