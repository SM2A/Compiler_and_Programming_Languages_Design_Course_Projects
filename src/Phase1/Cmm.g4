grammar Cmm;

cmm
    :  (struct)* (function)* main  EOF
    ;

struct
    : STRUCT_DECLARATION IDENTIFIER BEGIN struct_body END
    ;

struct_body
    : (var_dec | setter_getter)*
    ;

setter_getter
    : OPEN_PARENTHESES (VAR_TYPE IDENTIFIER COMMA)* VAR_TYPE IDENTIFIER CLOSE_PARENTHESES BEGIN setter getter END
    ;

setter
    : SET BEGIN ((IDENTIFIER ASSIGN expression) SEMICOLON*)* END
    ;

getter
    : GET RETURN (IDENTIFIER | expression) END
    ;

var_dec
    : (int_bool_dec | list_dec | struct_ins | fptr_dec)*
    ;

int_bool_dec
    : VAR_TYPE IDENTIFIER SEMICOLON*
    | VAR_TYPE IDENTIFIER ASSIGN (INTEGER_VALUE | BOOLEAN_VALUE) SEMICOLON*
    ;

list_dec
    : LIST NUMBER_SIGN (LIST_TYPE | list_dec) IDENTIFIER SEMICOLON*
    ;

struct_ins
    : STRUCT_DECLARATION IDENTIFIER IDENTIFIER SEMICOLON*
    ;

fptr_dec
    : FUNCTIOR_POINTER LESS_THAN ( (FUNCTION_TYPE COMMA)* FUNCTION_TYPE ) MINUS GRATER_THAN FUNCTION_TYPE GRATER_THAN IDENTIFIER SEMICOLON*
    | FUNCTIOR_POINTER LESS_THAN ( (FUNCTION_TYPE COMMA)* FUNCTION_TYPE ) MINUS GRATER_THAN FUNCTION_TYPE GRATER_THAN IDENTIFIER ASSIGN IDENTIFIER SEMICOLON*
    ;

expression
    :
    ;






















// Declaration
MAIL_FUNCTION 			: 'main()';
STRUCT_DECLARATION		: 'struct';

// Types
PRIMITIVE_TYPE			: INT | BOOL | LIST | FUNCTIOR_POINTER;
ARG_TYPE                : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION;
FUNCTION_TYPE           : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION | VOID;
VAR_TYPE                : INT | BOOL;
LIST_TYPE               : INT | BOOL | STRUCT_DECLARATION;

// Primitives Values
INTEGER_VALUE			: ZERO | NON_ZERO_NUMBER NUMBER*;
BOOLEAN_VALUE			: TRUE | FALSE;

// Operations
MATH_OPERATION			: PLUS | MINUS | MULTIPLY | DIVIDE;
COMPARISON_OPERATION	: EQUAL | GRATER_THAN | LESS_THAN;
LOGICAL_OPERATION		: AND | OR | NOT;
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
