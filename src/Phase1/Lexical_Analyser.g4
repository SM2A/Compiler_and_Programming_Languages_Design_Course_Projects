lexer grammar Lexical_Analyser;

IDENTITIER				: [a-zA-Z_][A-Za-z0-9_]*;

// Types
PIRIMITIVE_TYPE			: INT | BOOL;

// Primitives Values
INTEGER_VALUE			: ZERO | NON_ZERO_NUMBER NUMBER*;
BOOLEAN_VALUE			: TRUE | FALSE;

// Declaration
MAIL_FUNCTION 			: 'main()';
STRUCT_DECLIRATION		: 'struct';

// Operations
MATH_OPERATION			: PLUS | MINUS | MULTIPLY | DIVIDE;
COMPERATION_OPERATION	: EQUAL | GRATER_THAN | LESS_THAN;
LOGICAL_OPERATION		: AND | OR | NOT;

// Values
TRUE					: 'true';
FALSE					: 'false';
ZERO 					: '0';
NUMBER					: [0-9];
NON_ZERO_NUMBER			: [1-9];
UPPERCASE_LETTER		: [A-Z];
LOWERCASE_LETTER		: [a-z];

// Primitives
INT 					: 'int';
BOOL 					: 'bool';

// Struct Functions
SETTER					: 'set';
GETTER					: 'get';

// Scope
BEGIN					: 'begin';
END						: 'end';

// Builtin Functions
BUILTIN_DISPLAY			: 'display';
BUILTIN_SIZE			: 'size';
BUILTIN_APPEND			: 'append';

// Symbols
SEMICOLON				: ';';
ASSIGNMENT				: '=';
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