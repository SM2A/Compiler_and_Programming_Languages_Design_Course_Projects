lexer grammar Lexical_Analyser;

// Declaration
MAIL_FUNCTION 			: 'main()';
STRUCT_DECLARATION		: 'struct';

// Types
PRIMITIVE_TYPE			: INT | BOOL | LIST | FUNCTIOR_POINTER;

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
IDENTIFIER				: (LETTER | UNDELINE)(LETTER | NUMBER | UNDELINE)*;

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
LIST_SEPERATOR			: ',';
LIST_TYPE				: '#';
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