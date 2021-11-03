lexer grammar Lexical_Analyser;

// Declaration
MAIL_FUNCTION 			: 'main()'
							{System.out.println(getLine() + " : " + "MAIL_FUNCTION" + " => " + getText());};
STRUCT_DECLIRATION		: 'struct'
							{System.out.println(getLine() + " : " + "STRUCT_DECLIRATION" + " => " + getText());};

// Types
PIRIMITIVE_TYPE			: INT
							{System.out.println(getLine() + " : " + "PIRIMITIVE_TYPE" + " => " + getText());}
						| BOOL
							{System.out.println(getLine() + " : " + "PIRIMITIVE_TYPE" + " => " + getText());}
						| FUNCTIOR_POINTER
                        	{System.out.println(getLine() + " : " + "FUNCTIOR_POINTER" + " => " + getText());};

// Primitives Values
INTEGER_VALUE			: ZERO
							{System.out.println(getLine() + " : " + "INTEGER_VALUE" + " => " + getText());}
						| NON_ZERO_NUMBER NUMBER*
							{System.out.println(getLine() + " : " + "INTEGER_VALUE" + " => " + getText());};
BOOLEAN_VALUE			: TRUE
							{System.out.println(getLine() + " : " + "TRUE" + " => " + getText());}
						| FALSE
							{System.out.println(getLine() + " : " + "FALSE" + " => " + getText());};

// Operations
MATH_OPERATION			: PLUS
							{System.out.println(getLine() + " : " + "PLUS" + " => " + getText());}
						| MINUS
							{System.out.println(getLine() + " : " + "MINUS" + " => " + getText());}
						| MULTIPLY
							{System.out.println(getLine() + " : " + "MULTIPLY" + " => " + getText());}
						| DIVIDE
							{System.out.println(getLine() + " : " + "DIVIDE" + " => " + getText());};
COMPERATION_OPERATION	: EQUAL
							{System.out.println(getLine() + " : " + "EQUAL" + " => " + getText());}
						| GRATER_THAN
							{System.out.println(getLine() + " : " + "GRATER_THAN" + " => " + getText());}
						| LESS_THAN
							{System.out.println(getLine() + " : " + "LESS_THAN" + " => " + getText());};
LOGICAL_OPERATION		: AND
							{System.out.println(getLine() + " : " + "AND" + " => " + getText());}
						| OR
							{System.out.println(getLine() + " : " + "OR" + " => " + getText());}
						| NOT
							{System.out.println(getLine() + " : " + "NOT" + " => " + getText());};

// Methods
SETTER					: SET
							{System.out.println(getLine() + " : " + "SETTER" + " => " + getText());};
GETTER					: GET
							{System.out.println(getLine() + " : " + "GETTER" + " => " + getText());};

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
//IDENTIFIER				: (LETTER | UNDELINE)(LETTER | NUMBER | UNDELINE)*
//							{System.out.println(getLine() + " : " + "IDENTIFIER" + " => " + getText());};

// Values
TRUE					: 'true';
FALSE					: 'false';
ZERO 					: '0';
NUMBER					: [0-9];
NON_ZERO_NUMBER			: [1-9];
UPPERCASE_LETTER		: [A-Z];
LOWERCASE_LETTER		: [a-z];
LETTER					: UPPERCASE_LETTER | LOWERCASE_LETTER;

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