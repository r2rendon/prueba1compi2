%{

    #include <cstdio>
    using namespace std;
    int yylex();
    extern int yylineno;
    void yyerror(const char * s){
        fprintf(stderr, "Line: %d, error: %s\n", yylineno, s);
    }

%}

%token EOL
%token ADD SUB MUL DIV ABS
%token NUMBER

%%

exprlist: /* E */
    | exprlist exp EOL { printf("= %d\n", $2);}
    ;

exp: exp ADD factor {$$ = $1+$3; }
    | exp SUB factor {$$ = $1 - $3;}
    | factor { $$ = $1; }
    ;

factor: factor MUL term { $$ = $1*$3; }
    | factor DIV term { $$ = $1/$3; }
    | term { $$ = $1; }
    ;

term: NUMBER { $$ = $1; }
    | ABS term { $$ = $2 >= 0 ? $2 : -1 * $2;  }
    ;

%%