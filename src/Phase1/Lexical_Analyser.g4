lexer grammar Lexical_Analyser;

MAIL_FUNCTION 			: 'main()' {System.out.println("main"+" "+getLine());};
NEW_LINE 	  			: '\r\n' {System.out.println("new line"+" "+getLine());};
BEGIN 		  			: 'begin' {System.out.println("begin"+" "+getLine());};
END 		  			: 'end' {System.out.println("end"+" "+getLine());};
DISPLAY		  			: 'display' {System.out.println("display"+" "+getLine());};
COMMNT_START  			: '/*' {System.out.println("commnt start"+" "+getLine());};
COMMNT_END 	  			: '*/' {System.out.println("comment end"+" "+getLine());};
OPEN_PARENTHESES 		: '(' {System.out.println("open parentheses"+" "+getLine());};
CLOSE_PARENTHESES 		: ')' {System.out.println("close parentheses"+" "+getLine());};
OPEN_BRACKETS	 		: '[' {System.out.println("open brackets"+" "+getLine());};
CLOSE_BRACKERTS 		: ']' {System.out.println("close brackets"+" "+getLine());};
INTEGER_VALUE			: '0' | [1-9][0-9]* {System.out.println("int val"+" "+getLine());};
BOOLEAN_VALUE			: 'true' | 'false' {System.out.println("bool val"+" "+getLine());};
STRUCT_DECLIRATION		: 'struct' {System.out.println("struct"+" "+getLine());};
SEMICOLON				: ';' {System.out.println("semicolon"+" "+getLine());};
ASSIGNMENT				: '=' {System.out.println("assign"+" "+getLine());};
ACCESS					: '.' {System.out.println("access"+" "+getLine());};
LIST_SEPERATOR			: ',' {System.out.println("seperator"+" "+getLine());};
LIST_TYPE				: '#' {System.out.println("list type"+" "+getLine());};
PIRIMITIVE_TYPE			: 'int' | 'bool' {System.out.println("primitive : "+getText()+" "+getLine());}; //todo not working properly
SETTER					: 'set' {System.out.println("setter"+" "+getLine());};
GETTER					: 'get' {System.out.println("getter"+" "+getLine());};
IDENTITIER				: [a-zA-Z_][A-Za-z0-9_]* {System.out.println("var : "+getText()+" "+getLine());};
MATH_OPERATION			: '+' | '-' | '*' | '/' {System.out.println("math operation : "+getText()+" "+getLine());};
COMPERATION_OPERATION	: '==' | '<' | '>' {System.out.println("comperation operation : "+getText()+" "+getLine());};
LOGICAL_OPERATION		: '&' | '|' | '~' {System.out.println("logical operation : "+getText()+" "+getLine());};
WHITE_SPACE   : [ \t] -> skip;