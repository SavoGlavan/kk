%{
#include <stdio.h>
%}
%token BROJ
%left '+' '-'
%left '*' '/'
%left UMINUS

%% 
s: izraz
	{printf("%d\n",$1);};
izraz: izraz '+' izraz
	{$$ = $1 + $3;}
     | izraz '-' izraz
	{$$ = $1 - $3;}
     | izraz '*' izraz
	{$$ = $1 * $3;}
     | izraz '/' izraz
	{if($3 == 0) yyerror("Djeljenje sa nulom");
	 else $$ = $1 / $3;}
     | '-' izraz
	{$$ = - $2;}
     | '(' izraz ')'
	{$$ = $2;}
     | BROJ;

%%
#include "C:\Users\Kmica\Desktop\flex\lex.yy.c"

yyerror(char *s)
{
  printf("%s\n",s);
}
main()
{
  printf("Pozdrav iz parsera");
  return yyparse();
}