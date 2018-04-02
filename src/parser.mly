%{ 
  open Syntax
%}

%token <int> INT
%token PLUS MINUS TIMES DIVIDE POWER LPAREN RPAREN NEWLINE

%start prog
%type <int> prog

%%

prog: 
  | prog line { $1 }

line:
  | NEWLINE { con 0 }
  | expr NEWLINE { $1 }

expr:
  | INT { con $1 }
  | LPAREN expr op expr RPAREN { exp $2 $3 $4 }

op:
  | PLUS { A }
  | MINUS { S }
  | TIMES { M }
  | DIVIDE { D }
  | POWER { E }

%%
