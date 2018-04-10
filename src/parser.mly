%{ 
  open Syntax
%}

%token <float> NUM
%token PLUS MINUS TIMES DIVIDE POWER LPAREN RPAREN NEWLINE

%left PLUS MINUS
%left TIMES DIVIDE
%right POWER

%start prog
%type <Syntax.expression> prog

%%

prog: 
  | { con 0. }
  | line { $1 }

line:
  | NEWLINE { con 0. }
  | expr NEWLINE { $1 }

expr:
  | LPAREN NUM LPAREN { con $2 }
  | LPAREN expr op expr RPAREN { exp $2 $3 $4 }
  | expr LPAREN expr RPAREN { exp $1 M $3 }
  | LPAREN expr RPAREN expr { exp $2 M $4 }
  | expr op expr { exp $1 $2 $3 }
  | NUM { con $1 }
  | LPAREN RPAREN { con 0. }
  | { con 1. }

op:
  | PLUS { A }
  | MINUS { S }
  | TIMES { M }
  | DIVIDE { D }
  | POWER { E }

%%
