%token <int> INT
%token PLUS MINUS TIMES DIVIDE POWER
%token LPAREN RPAREN
%token EOF

%left MINUS PLUS
%left DIVIDE TIMES
%left POWER

%start <expr> prog

%%

prog:
  | e = expr; EOF { e }
;

expr:
  | i = INT { cons i }
| LPAREN; a = expr; m = op; b = expr; RPAREN { eval (exp a m b) }
;

op:
  | PLUS { A }
  | MINUS { S }
  | TIMES { M }
  | DIVIDE { D }
  | POWER { E }
;
