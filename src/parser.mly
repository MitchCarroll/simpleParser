%{ 
  open Syntax
%}

%token <int> NUM
%token PLUS MINUS TIMES DIVIDE POWER LPAREN RPAREN NEWLINE

%left MINUS PLUS DIVIDE TIMES POWER

%start prog
%type <int> prog

%%

prog: 
  | { 0 }
  | prog line { $1 }

line:
  | NEWLINE { con 0 }
  | expr NEWLINE { $1 }

expr:
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
