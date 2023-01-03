%option noyywrap
%{
#include <stdio.h>
#include "C:\Users\Kmica\Desktop\flex\tab2.h"
%}

cijeli [0-9]+

%%
{cijeli} {yyval.ival=atoi(yytext); return BROJ;}
[ \t] ;
. {return yytext[0];}

%%
