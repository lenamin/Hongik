%{
#include <stdio.h>
int lovecount = 0;
%}

%%
L|love	{lovecount++;}
.	;
\n	;
 
%%

   
int main(){ 
	yylex();
	printf("number of love : %d\n", lovecount);
	return 0;
}
 
int yywrap(){ 
	return 1;
} 
