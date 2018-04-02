%token <int> NUM
%token PLUS MINUS TIMES DIVIDE POWER LPAREN RPAREN NEWLINE

%start prog
%type <expression> prog
%%

prog: 
  | { }
  | prog line { }

line:
  | NEWLINE { }
  | expr NEWLINE { $1 }

expr:
  | NUM { $1 }
  | LPAREN expr op expr RPAREN { eval (exp $2 $3 $4) }

op:
  | PLUS { A }
  | MINUS { S }
  | TIMES { M }
  | DIVIDE { D }
  | POWER { E }

%%
