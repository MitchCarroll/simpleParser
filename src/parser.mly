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
  | { con 0. }
  | NUM { con $1 }
  | expr op expr { exp $1 $2 $3 }
  | LPAREN expr op expr RPAREN { exp $2 $3 $4 }

op:
  | PLUS { A }
  | MINUS { S }
  | TIMES { M }
  | DIVIDE { D }
  | POWER { E }

%%
