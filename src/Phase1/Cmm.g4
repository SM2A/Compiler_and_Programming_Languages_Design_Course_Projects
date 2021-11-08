grammar Cmm;

cmm 					: (struct)* (function)* main EOF;

struct					: STRUCT_DECLARATION IDENTIFIER {System.out.println("StructDec : " + $IDENTIFIER.getText());}
							BEGIN NEW_LINE+ struct_body NEW_LINE+ END NEW_LINE+;

struct_body				: (var_dec | setter_getter)+;

setter_getter			: OPEN_PARENTHESES ((INT | BOOL) IDENTIFIER COMMA)* (INT | BOOL) IDENTIFIER CLOSE_PARENTHESES
							BEGIN NEW_LINE+ setter getter NEW_LINE* END NEW_LINE+;

setter					: SET {System.out.println("Setter");} BEGIN NEW_LINE+ ((IDENTIFIER ASSIGN expression)
							(NEW_LINE|SEMICOLON)*)* NEW_LINE+ END (SEMICOLON | NEW_LINE)+
						| SET {System.out.println("Setter");} NEW_LINE+ (IDENTIFIER ASSIGN expression)
							SEMICOLON* (SEMICOLON | NEW_LINE)+;

getter					: GET NEW_LINE+ {System.out.println("Getter");} BEGIN RETURN (IDENTIFIER | expression) END
							(SEMICOLON | NEW_LINE)+
						| GET NEW_LINE+ {System.out.println("Getter");} RETURN (IDENTIFIER | expression)
							(SEMICOLON | NEW_LINE)+;

main 					: MAIN_FUNCTION {System.out.println("Main");} BEGIN body END;
body					: (var_dec | statement | expression)* | ;
var_dec					: (int_bool_dec | list_dec | struct_ins | fptr_dec)+;
function				: function_dec BEGIN NEW_LINE* body NEW_LINE* END NEW_LINE*;

function_dec			: function_type IDENTIFIER {System.out.println("FunctionDec : " + $IDENTIFIER.getText());}
							arg_dec;

arg_dec					: OPEN_PARENTHESES ((function_type) arg COMMA)* ((function_type) arg) CLOSE_PARENTHESES
    					| OPEN_PARENTHESES CLOSE_PARENTHESES;

arg						: IDENTIFIER {System.out.println("ArgumentDec : " + $IDENTIFIER.getText());};

expression				: OPEN_PARENTHESES expression CLOSE_PARENTHESES
						| M=(MINUS | NOT) expression {System.out.println("Operator:" + $M.getText());}
						| expression X=(DIVIDE | MULTIPLY) expression {System.out.println("Operator:" + $X.getText());}
						| expression Y=(PLUS | MINUS) expression {System.out.println("Operator:" + $Y.getText());}
						| expression Z=(GRATER_THAN | LESS_THAN) expression
							{System.out.println("Operator:" + $Z.getText());}
						| expression F=EQUAL expression {System.out.println("Operator:" + $F.getText());}
						| expression AND expression {System.out.println("Operator : &");}
						| expression OR expression {System.out.println("Operator : |");}
						| expression ASSIGN expression {System.out.println("Operator : =");}
						| expression ACCESS expression {System.out.println("Operator : .");}
						| (INTEGER_VALUE | BOOLEAN_VALUE | IDENTIFIER | NULL | OPEN_BRACKETS CLOSE_BRACKERTS) // need to add more
						| (SEMICOLON | NEW_LINE)+;

statement				: conditional_statement | loop_statement | return_statement | function_call_statement
							| display_statement | size_statement | append_statement ;

conditional_statement	: IF {System.out.println("Conditional : if");} condition statement NEW_LINE* else_statement?
       					| IF {System.out.println("Conditional : if");} condition BEGIN statement+ END
       						NEW_LINE* else_statement?;

condition				: OPEN_PARENTHESES expression CLOSE_PARENTHESES NEW_LINE*| expression NEW_LINE*; // BEGIN and END
else_statement			: ELSE NEW_LINE+ {System.out.println("Conditional:else");} statement;
return_statement		: RETURN (expression)? (NEW_LINE | SEMICOLON)+ {System.out.println("Return");};

display_statement		: BUILTIN_DISPLAY {System.out.println("Built-in: display");} OPEN_PARENTHESES expression
							CLOSE_PARENTHESES SEMICOLON*
						| BUILTIN_DISPLAY OPEN_PARENTHESES IDENTIFIER ACCESS IDENTIFIER CLOSE_PARENTHESES
							SEMICOLON* {System.out.println("Built-in: display");}
						| BUILTIN_DISPLAY OPEN_PARENTHESES IDENTIFIER list_element CLOSE_PARENTHESES
							SEMICOLON* {System.out.println("Built-in: display");}
						| BUILTIN_DISPLAY {System.out.println("Built-in: display");} OPEN_PARENTHESES
							size_statement CLOSE_PARENTHESES SEMICOLON*;

loop_statement			: while_statement | do_while_statement;

while_statement			: WHILE {System.out.println("Loop : while");} OPEN_PARENTHESES expression CLOSE_PARENTHESES
							BEGIN (statement | expression)* END;

do_while_statement		: DO BEGIN {System.out.println("Loop : do...while");} statement* END WHILE OPEN_PARENTHESES
							expression CLOSE_PARENTHESES;

size_statement			: BUILTIN_SIZE OPEN_PARENTHESES IDENTIFIER list_element CLOSE_PARENTHESES
    					| BUILTIN_SIZE OPEN_PARENTHESES IDENTIFIER CLOSE_PARENTHESES;

list_element			: OPEN_BRACKETS (INTEGER_VALUE | list_element) CLOSE_BRACKERTS;

append_statement		: BUILTIN_APPEND OPEN_PARENTHESES IDENTIFIER COMMA expression CLOSE_PARENTHESES
							(NEW_LINE | SEMICOLON)+
						| BUILTIN_APPEND OPEN_PARENTHESES IDENTIFIER list_element COMMA expression CLOSE_PARENTHESES
							(NEW_LINE | SEMICOLON)+;

function_call_statement	: (IDENTIFIER ASSIGN)? IDENTIFIER {System.out.println("FunctionCall");} OPEN_PARENTHESES 
							(function_call_arg COMMA)* (function_call_arg) CLOSE_PARENTHESES
    					| (IDENTIFIER ASSIGN)? IDENTIFIER {System.out.println("FunctionCall");} OPEN_PARENTHESES
    						CLOSE_PARENTHESES;

function_call_arg		: IDENTIFIER | expression ;
function_type			: (int_bool_dec_ | list_dec_ | struct_ins_ | fptr_dec_ | VOID);
int_bool_dec_ 			: (INT | BOOL) ;
list_dec_				: LIST NUMBER_SIGN ((INT | BOOL) | list_dec_ | ) ; // needs fix
struct_ins_				: STRUCT_DECLARATION IDENTIFIER ;
fptr_dec_				: FUNCTIOR_POINTER LESS_THAN ( (function_type COMMA)* (function_type) ) MINUS GRATER_THAN
							(function_type) GRATER_THAN;

int_bool_dec			: (INT | BOOL) var_dec_name (NEW_LINE | SEMICOLON)*
    					| (INT | BOOL) var_dec_name ASSIGN {System.out.println("Operator:=");}
    						(INTEGER_VALUE | BOOLEAN_VALUE) (NEW_LINE | SEMICOLON)*;

list_dec				: LIST NUMBER_SIGN (INT | BOOL | STRUCT_DECLARATION | list_dec) var_dec_name
							(SEMICOLON | NEW_LINE)*
    					| LIST NUMBER_SIGN (INT | BOOL | STRUCT_DECLARATION | list_dec) var_dec_name ASSIGN
    						function_call_statement (SEMICOLON | NEW_LINE)*;

struct_ins				: STRUCT_DECLARATION IDENTIFIER (var_dec_name COMMA)* var_dec_name SEMICOLON*;

fptr_dec				: FUNCTIOR_POINTER LESS_THAN ( (function_type COMMA)* function_type ) MINUS GRATER_THAN
							function_type GRATER_THAN var_dec_name SEMICOLON*
						| FUNCTIOR_POINTER LESS_THAN ( (function_type COMMA)* function_type ) MINUS GRATER_THAN
							function_type GRATER_THAN var_dec_name ASSIGN {System.out.println("Operator:=");}
							IDENTIFIER SEMICOLON*;

var_dec_name			: IDENTIFIER {System.out.println("VarDec : " + $IDENTIFIER.getText());};


// Declaration
MAIN_FUNCTION 			: 'main()';
STRUCT_DECLARATION		: 'struct';

// Primitives Values
INTEGER_VALUE			: ZERO | NON_ZERO_NUMBER NUMBER*;
BOOLEAN_VALUE			: TRUE | FALSE;

// Primitives
INT 					: 'int';
BOOL 					: 'bool';
LIST 					: 'list';
VOID					: 'void';
FUNCTIOR_POINTER		: 'fptr';

// Struct Functions
SET						: 'set';
GET						: 'get';

// Scope
BEGIN					: 'begin';
END						: 'end';

// Builtin Functions
BUILTIN_DISPLAY			: 'display';
BUILTIN_SIZE			: 'size';
BUILTIN_APPEND			: 'append';

// Control Structures
DO						: 'do';
WHILE					: 'while';
IF						: 'if';
ELSE					: 'else';

// Other KeyWords
RETURN					: 'return';

// Variable
IDENTIFIER				: (LETTER | UNDELINE)(LETTER | NUMBER | UNDELINE)*; // TODO other symbols

// Values
TRUE					: 'true';
FALSE					: 'false';
ZERO 					: '0';
NUMBER					: [0-9];
NON_ZERO_NUMBER			: [1-9];
LETTER					: UPPERCASE_LETTER | LOWERCASE_LETTER;
UPPERCASE_LETTER		: [A-Z];
LOWERCASE_LETTER		: [a-z];
NULL					: 'null';

// Symbols
SEMICOLON				: ';';
ASSIGN					: '=';
ACCESS					: '.';
COMMA		        	: ',';
NUMBER_SIGN				: '#';
AND						: '&';
OR						: '|';
NOT						: '~';
EQUAL					: '==';
GRATER_THAN				: '>';
LESS_THAN				: '<';
PLUS					: '+';
MINUS					: '-';
MULTIPLY				: '*';
DIVIDE					: '/';
OPEN_PARENTHESES		: '(';
CLOSE_PARENTHESES		: ')';
OPEN_BRACKETS			: '[';
CLOSE_BRACKERTS 		: ']';
UNDELINE				: '_';
COMMNT_START			: '/*';
COMMNT_END				: '*/';

// WhiteSpace
NEW_LINE 				: RNL | NL;
NL						: '\n';
RNL						: '\r';
WHITE_SPACE				: [ \t] -> skip;
