grammar Cmm;

cmm
    :  (struct)* (function)* main  EOF
    ;

main
    :   MAIL_FUNCTION { System.out.println("Main"); } BEGIN (body) END
    ;

functionCall
    :  IDENTIFIER (argList)+
    ;

argList
    :   OPEN_PARENTHESES (expression ',')* expression CLOSE_PARENTHESES
    |   OPEN_PARENTHESES CLOSE_PARENTHESES
    ;

function
    :   funcDec BEGIN body END
    ;

body
    : (if_ | statement | returnStatement)* returnStatement (if_ | statement | returnStatement)*
    | (if_ | statement | returnStatement)*
    ;

funcDec
    :  FUNCTION_TYPE IDENTIFIER { System.out.println("FunctionDec : " + $IDENTIFIER.getText()); } argDec
    ;

argDec
    :   OPEN_PARENTHESES (arg LIST_SEPERATOR)* arg CLOSE_PARENTHESES
    |   OPEN_PARENTHESES CLOSE_PARENTHESES
    ;

arg
    :  ARG_TYPE IDENTIFIER { System.out.println("ArgumentDec : " + $Identifier.getText()); }
    ;

if_
    :   IF { System.out.println("Conditional : if"); } expression BEGIN if_ END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN if_ END else_
    |   IF { System.out.println("Conditional : if"); } expression BEGIN returnStatement END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN returnStatement else_ END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN statement END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN statement else_ END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN body END
    |   IF { System.out.println("Conditional : if"); } expression BEGIN body END else_
    ;

else_
    :   ELSE { System.out.println("Conditional : else"); } BEGIN body END
    |   ELSE { System.out.println("Conditional : else"); } BEGIN returnStatement END
    |   ELSE { System.out.println("Conditional : else"); } BEGIN if_ END
    |   ELSE { System.out.println("Conditional : else"); } BEGIN statement END
    ;

returnStatement
    :   return_ SEMICOLON
    ;

return_
    : RETURN { System.out.println("Return"); } expression
    ;

statement
    : display SEMICOLON
    | {System.out.println("FunctionCall");} functionCall SEMICOLON
    ;

expression
    :   expression 'or' orExpression { System.out.println("Operator : or"); }
    |   orExpression
    ;

orExpression
    :   orExpression 'and' andExpression { System.out.println("Operator : and"); }
    |   andExpression
    ;


andExpression
    :   andExpression 'is' isNotExpression { System.out.println("Operator : is"); }
    |   andExpression 'not' isNotExpression { System.out.println("Operator : not"); }
    |   isNotExpression
    ;

isNotExpression
    :   isNotExpression '<' ltgtExpression { System.out.println("Operator : <"); }
    |   isNotExpression '>' ltgtExpression { System.out.println("Operator : >"); }
    |   ltgtExpression
    ;

ltgtExpression
    :   ltgtExpression '+' addSubExpression { System.out.println("Operator : +"); }
    |   ltgtExpression '-' addSubExpression { System.out.println("Operator : -"); }
    |   addSubExpression
    ;

addSubExpression
    :   addSubExpression '*' mulDivExpression { System.out.println("Operator : *"); }
    |   addSubExpression '/' mulDivExpression { System.out.println("Operator : /"); }
    |   mulDivExpression
    ;

mulDivExpression
    :   '~' tildaNegOperator { System.out.println("Operator : ~"); }
    |   '-' tildaNegOperator { System.out.println("Operator : -"); }
    |   tildaNegOperator
    ;

tildaNegOperator
    :   tildaNegOperator '::' concatExpression { System.out.println("Operator : ::"); }
    |   concatExpression
    ;

concatExpression
    :   subscriptExpression { System.out.println("Size"); } '.size'
    |   subscriptExpression
    ;

subscriptExpression
    :   subscriptExpression '[' expression ']'
    |   factor_ '[' expression ']'
    |   factor_
    ;

factor_
    :   '(' expression ')'
    |   functionCall
    |   INT
    |   BOOL
    |   IDENTIFIER
    |   listType
    ;

listType
    :   OPEN_BRACKETS ((expression) ',')* (expression) CLOSE_BRACKERTS
    |   OPEN_BRACKETS CLOSE_BRACKERTS
    ;

display
    :   { System.out.println("Built-in : display"); }
        BUILTIN_DISPLAY OPEN_PARENTHESES expression CLOSE_PARENTHESES
    ;

size
    :   { System.out.println("Size"); }
        BUILTIN_SIZE OPEN_PARENTHESES expression CLOSE_PARENTHESES
    ;

append
    :   { System.out.println("Append"); }
        BUILTIN_APPEND OPEN_PARENTHESES expression CLOSE_PARENTHESES
    ;



// Declaration
MAIL_FUNCTION 			: 'main()';
STRUCT_DECLARATION		: 'struct';

// Types
PRIMITIVE_TYPE			: INT | BOOL | LIST | FUNCTIOR_POINTER;
ARG_TYPE                : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION;
FUNCTION_TYPE           : INT | BOOL | LIST | FUNCTIOR_POINTER | STRUCT_DECLARATION | VOID;

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
