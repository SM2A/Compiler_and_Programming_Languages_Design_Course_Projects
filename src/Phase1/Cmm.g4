grammar Cmm;

cmm
    :  (struct)* (function)* main  EOF
    ;

struct
    : STRUCT_DECLARATION IDENTIFIER {System.out.println("StructDec : " + $IDENTIFIER.getText());} BEGIN struct_body END
    ;

struct_body
    : (var_dec | setter_getter)*
    ;

setter_getter
    : OPEN_PARENTHESES (VAR_TYPE IDENTIFIER COMMA)* VAR_TYPE IDENTIFIER CLOSE_PARENTHESES BEGIN setter getter END
    ;

setter
    : SET {System.out.println("Setter");} BEGIN ((IDENTIFIER ASSIGN expression) SEMICOLON*)* END
    | SET {System.out.println("Setter");} (IDENTIFIER ASSIGN expression) SEMICOLON*
    ;

getter
    : GET {System.out.println("Getter");} BEGIN RETURN (IDENTIFIER | expression) END
    | GET {System.out.println("Getter");} RETURN (IDENTIFIER | expression)
    ;

expression: OPEN_PARENTHESES expression CLOSE_BRACKERTS
            | M=(MINUS | NOT) expression {System.out.println("Operator:" + $M.getText());}
            | expression X=(DIVIDE | MULTIPLY) expression {System.out.println("Operator:" + $X.getText());}
            | expression Y=(PLUS | MINUS) expression {System.out.println("Operator:" + $Y.getText());}
            | expression Z=(GRATER_THAN | LESS_THAN) expression {System.out.println("Operator:" + $Z.getText());}
            | expression F=EQUAL expression {System.out.println("Operator:" + $F.getText());}
            | expression AND expression {System.out.println("Operator : &");}
            | expression OR expression {System.out.println("Operator : |");}
            | expression ASSIGN expression {System.out.println("Operator : =");}
            | (INTEGER_VALUE | BOOLEAN_VALUE | IDENTIFIER | NULL | OPEN_BRACKETS CLOSE_BRACKERTS); // need to add more

main
    : MAIL_FUNCTION {System.out.println("Main");} BEGIN body END;

function
    : function_dec BEGIN body END;

body
    : (statement)* return_statement (statement)*
    | (statement)*
    ;

function_dec
    : FUNCTION_TYPE IDENTIFIER {System.out.println("FunctionDec : " + $IDENTIFIER.getText());} arg_dec
    ;

arg_dec
    : OPEN_PARENTHESES (ARG_TYPE arg COMMA)* (ARG_TYPE arg) CLOSE_PARENTHESES
    | OPEN_PARENTHESES CLOSE_PARENTHESES
    ;

arg: IDENTIFIER {System.out.println("ArgumentDec : " + $IDENTIFIER.getText());} ;

statement: normal_brace | conditional_statement | loop_statement | return_statement | function_call_statement
    | display_statement | assignment_statement | size_statement | append_statement | var_dec;
normal_brace: BEGIN statement* END;
conditional_statement: IF {System.out.println("Conditional:if");} condition statement else_statement? ;
condition: OPEN_PARENTHESES expression CLOSE_PARENTHESES;
else_statement: ELSE {System.out.println("Conditional:else");} statement;
return_statement: RETURN (expression)?{System.out.println("Return");};
display_statement: BUILTIN_DISPLAY OPEN_PARENTHESES expression CLOSE_PARENTHESES SEMICOLON* {System.out.println("Built-in: display");};
loop_statement: while_statement | do_while_statement;
while_statement: WHILE {System.out.println("Loop : while");} OPEN_PARENTHESES expression CLOSE_PARENTHESES BEGIN statement* END;
do_while_statement: DO BEGIN {System.out.println("Loop : do...while");} statement* END WHILE OPEN_PARENTHESES expression CLOSE_PARENTHESES;
assignment_statement: var_dec SEMICOLON*;
size_statement
    : BUILTIN_SIZE OPEN_PARENTHESES IDENTIFIER list_element CLOSE_PARENTHESES
    | BUILTIN_SIZE OPEN_PARENTHESES IDENTIFIER CLOSE_PARENTHESES
    ;
list_element: OPEN_BRACKETS (INTEGER_VALUE | list_element) CLOSE_BRACKERTS;
append_statement
    : OPEN_PARENTHESES IDENTIFIER list_element COMMA expression CLOSE_PARENTHESES
    | OPEN_PARENTHESES IDENTIFIER COMMA expression CLOSE_PARENTHESES
    ;
function_call_statement
    : IDENTIFIER {System.out.println("FunctionCall");} OPEN_PARENTHESES (IDENTIFIER COMMA)* (ARG_TYPE IDENTIFIER) CLOSE_PARENTHESES
    | IDENTIFIER {System.out.println("FunctionCall");} OPEN_PARENTHESES CLOSE_PARENTHESES
    ;

var_dec
    : (int_bool_dec | list_dec | struct_ins | fptr_dec)+
    ;

function_type_
    : (int_bool_dec_ | list_dec_ | struct_ins_ | fptr_dec_)*
    ;

int_bool_dec_
    : VAR_TYPE ;

list_dec_
    : LIST NUMBER_SIGN (LIST_TYPE | list_dec_) ;

struct_ins_
    : STRUCT_DECLARATION IDENTIFIER ;

fptr_dec_
    : FUNCTIOR_POINTER LESS_THAN ( (FUNCTION_TYPE COMMA)* FUNCTION_TYPE ) MINUS GRATER_THAN FUNCTION_TYPE GRATER_THAN
    ;

int_bool_dec
    : VAR_TYPE var_dec_name SEMICOLON*
    | VAR_TYPE var_dec_name ASSIGN {System.out.println("Operator:=");} (INTEGER_VALUE | BOOLEAN_VALUE) SEMICOLON*
    ;

list_dec
    : LIST NUMBER_SIGN (LIST_TYPE | list_dec) var_dec_name SEMICOLON*
    ;

struct_ins
    : STRUCT_DECLARATION IDENTIFIER var_dec_name SEMICOLON*
    ;

fptr_dec
    : FUNCTIOR_POINTER LESS_THAN ( (function_type_ COMMA)* function_type_ ) MINUS GRATER_THAN function_type_ GRATER_THAN var_dec_name SEMICOLON*
    | FUNCTIOR_POINTER LESS_THAN ( (function_type_ COMMA)* function_type_ ) MINUS GRATER_THAN function_type_ GRATER_THAN var_dec_name ASSIGN {System.out.println("Operator:=");} IDENTIFIER SEMICOLON*
    ;



var_dec_name: IDENTIFIER {System.out.println("VarDec : " + $IDENTIFIER.getText());} ;


// Declaration
MAIL_FUNCTION 			: 'main()';
STRUCT_DECLARATION		: 'struct';

// Types
VAR_TYPE                : INT | BOOL;
LIST_TYPE               : INT | BOOL | STRUCT_DECLARATION;
PRIMITIVE_TYPE			: INT | BOOL | LIST | FUNCTIOR_POINTER;
ARG_TYPE                : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION;
FUNCTION_TYPE           : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION | VOID;

// Primitives Values
INTEGER_VALUE			: ZERO | NON_ZERO_NUMBER NUMBER*;
BOOLEAN_VALUE			: TRUE | FALSE;

// Operations
//MATH_OPERATION			: PLUS | MINUS | MULTIPLY | DIVIDE;
//COMPARISON_OPERATION	: EQUAL | GRATER_THAN | LESS_THAN;
//LOGICAL_OPERATION		: AND | OR | NOT;
//ASSIGNMENT				: ASSIGN;

// Statements
//RETURN_STATEMENT		: RETURN ;
//SCOPE					: BEGIN | END;
BUILTIN_FUNCTION		: BUILTIN_DISPLAY | BUILTIN_SIZE | BUILTIN_APPEND;
CONTROL_STRUCTURE		: IF | ELSE | WHILE | DO;

// Methods
//SETTER					: SET;
//GETTER					: GET;

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
NEW_LINE				: '\r\n';
WHITE_SPACE				: [ \t] -> skip;
