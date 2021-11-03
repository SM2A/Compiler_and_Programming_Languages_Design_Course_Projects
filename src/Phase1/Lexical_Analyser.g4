lexer grammar Lexical_Analyser;

// Declaration
MAIL_FUNCTION 			: 'main()'
							{System.out.println(getLine() + " : " + "MAIL_FUNCTION" + " => " + getText());};
STRUCT_DECLARATION		: 'struct'
							{System.out.println(getLine() + " : " + "STRUCT_DECLARATION" + " => " + getText());};

// Types
PRIMITIVE_TYPE			: INT
							{System.out.println(getLine() + " : " + "PRIMITIVE_TYPE" + " => " + getText());}
						| BOOL
							{System.out.println(getLine() + " : " + "PRIMITIVE_TYPE" + " => " + getText());}
						| LIST
                        	{System.out.println(getLine() + " : " + "PRIMITIVE_TYPE" + " => " + getText());}
						| FUNCTIOR_POINTER
                        	{System.out.println(getLine() + " : " + "PRIMITIVE_TYPE" + " => " + getText());};

// Primitives Values
INTEGER_VALUE			: ZERO
							{System.out.println(getLine() + " : " + "INTEGER_VALUE" + " => " + getText());}
						| NON_ZERO_NUMBER NUMBER*
							{System.out.println(getLine() + " : " + "INTEGER_VALUE" + " => " + getText());};
BOOLEAN_VALUE			: TRUE
							{System.out.println(getLine() + " : " + "BOOLEAN_VALUE" + " => " + getText());}
						| FALSE
							{System.out.println(getLine() + " : " + "BOOLEAN_VALUE" + " => " + getText());};

// Operations
MATH_OPERATION			: PLUS
							{System.out.println(getLine() + " : " + "MATH_OPERATION" + " => " + getText());}
						| MINUS
							{System.out.println(getLine() + " : " + "MATH_OPERATION" + " => " + getText());}
						| MULTIPLY
							{System.out.println(getLine() + " : " + "MATH_OPERATION" + " => " + getText());}
						| DIVIDE
							{System.out.println(getLine() + " : " + "MATH_OPERATION" + " => " + getText());};
COMPARISON_OPERATION	: EQUAL
							{System.out.println(getLine() + " : " + "COMPARISON_OPERATION" + " => " + getText());}
						| GRATER_THAN
							{System.out.println(getLine() + " : " + "COMPARISON_OPERATION" + " => " + getText());}
						| LESS_THAN
							{System.out.println(getLine() + " : " + "COMPARISON_OPERATION" + " => " + getText());};
LOGICAL_OPERATION		: AND
							{System.out.println(getLine() + " : " + "LOGICAL_OPERATION" + " => " + getText());}
						| OR
							{System.out.println(getLine() + " : " + "LOGICAL_OPERATION" + " => " + getText());}
						| NOT
							{System.out.println(getLine() + " : " + "LOGICAL_OPERATION" + " => " + getText());};
ASSIGNMENT				: ASSIGN
							{System.out.println(getLine() + " : " + "ASSIGNMENT" + " => " + getText());};

// Statements
RETURN_STATEMENT		: RETURN
							{System.out.println(getLine() + " : " + "RETURN_STATEMENT" + " => " + getText());};
SCOPE					: BEGIN
							{System.out.println(getLine() + " : " + "SCOPE" + " => " + getText());}
						| END
							{System.out.println(getLine() + " : " + "SCOPE" + " => " + getText());};
BUILTIN_FUNCTION		: BUILTIN_DISPLAY
							{System.out.println(getLine() + " : " + "BUILTIN_FUNCTION" + " => " + getText());}
						| BUILTIN_SIZE
							{System.out.println(getLine() + " : " + "BUILTIN_FUNCTION" + " => " + getText());}
						| BUILTIN_APPEND
							{System.out.println(getLine() + " : " + "BUILTIN_FUNCTION" + " => " + getText());};
CONTROL_STRUCTURE		: IF
							{System.out.println(getLine() + " : " + "CONTROL_STRUCTURE" + " => " + getText());}
						| ELSE
							{System.out.println(getLine() + " : " + "CONTROL_STRUCTURE" + " => " + getText());}
						| WHILE
							{System.out.println(getLine() + " : " + "CONTROL_STRUCTURE" + " => " + getText());}
						| DO
							{System.out.println(getLine() + " : " + "CONTROL_STRUCTURE" + " => " + getText());};

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
IDENTIFIER				: (LETTER | UNDELINE)(LETTER | NUMBER | UNDELINE)*
							{System.out.println(getLine() + " : " + "IDENTIFIER" + " => " + getText());};

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
NEW_LINE				: '\r\n'
							{System.out.println(getLine() + " : " + "NEW_LINE" + " => " + getText());};
WHITE_SPACE				: [ \t] -> skip;