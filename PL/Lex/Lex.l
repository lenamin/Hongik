%{
#include <stdio.h>
int preprosessor_count = 0;
int octal_number_count = 0;
int negative_number_count = 0;
int positive_number_count = 0;
int operator_count = 0;
int comment_count = 0;
int equal_count = 0;
int open_brace_count = 0;
int close_brace_count = 0;
int word_case_count1 = 0;
int word_case_count2 = 0;
int word_count = 0;
int mark_count = 0;
%}
%%
#(.*)\n	{preprosessor_count++;}
0[0-7]+	{octal_number_count++;}
-[1-9]+	{negative_number_count++;}
[1-9][0-9]*	{positive_number_count++;}
"//"(.*)\n	{comment_count++;}
"/*"([^*]|(\*+[^*/]))*"*/"	{comment_count++;}
\+{2}|\-{2}	{operator_count++;}
[a-zA-Z]\*	{operator_count++;}
\+|\-|\*|\/|%	{operator_count++;}
!	{operator_count++;}
&{2}	{operator_count++;}
\|{2}	{operator_count++;}
={2}	{operator_count++;}
!=	{operator_count++;}
>=	{operator_count++;}
\<=	{operator_count++;}
>|\<	{operator_count++;}
,	{operator_count++;}
&	{operator_count++;}
=	{equal_count++;}
\{	{open_brace_count++;}
\}	{close_brace_count++;}
p{2}	{word_case_count1++;}
e[a-zA-Z]m	{word_case_count2++;}
[0-9a-zA-Z_]*	{word_count++;}
\n	{mark_count++;}
.	{mark_count++;}
%%

int main() {
	yylex();
	printf("preprocessor = %d \n", preprosessor_count);
	printf("octal number = %d \n", octal_number_count);
	printf("negative decimal number = %d \n", negative_number_count);
	printf("positive decimal number = %d \n", positive_number_count);
	printf("operator = %d \n", operator_count);
	printf("comment = %d \n", comment_count);
	printf("'=' = %d \n", equal_count);
	printf("'{' = %d \n", open_brace_count);
	printf("'}' = %d \n", close_brace_count);
	printf("wordcase1 = %d \n", word_case_count1);
	printf("wordcase2 = %d \n", word_case_count2);
	printf("word = %d \n", word_count);
	printf("mark = %d \n", mark_count);
	return 0;
}

int yywrap() {
	return 1;
}
