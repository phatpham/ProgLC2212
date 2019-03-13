{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    Bool   { TokenTypeBool _ } 
    Int    { TokenTypeInt _ } 
    int    { TokenInt _ $$ } 
    true   { TokenTrue _ }
    false  { TokenFalse _ }
    '<'    { TokenLessThan _ }
	'=='   { TokenEqualTo _ }
    '+'    { TokenPlus _ }
    var    { TokenVar _ $$ }
    if     { TokenIf _ }
    then   { TokenThen _ }
    else   { TokenElse _ }
    '='    { TokenAssign _ }
    '('    { TokenLParen _ } 
    ')'    { TokenRParen _ } 
	'['	   { TokenLList _ }
	']'    { TokenRList _ }
	','	   { TokenComma _ }
	';'    { TokenBreak _}




%nonassoc if
%nonassoc then
%nonassoc else
%nonassoc int true false var '(' ')'
%left '<'
%left ';'
%left '+'
%left ','
%right '='
%right '=='
%right '['


%% 
Exp : int                                       { TmInt $1 } 
    | var                                       { TmVar $1 }
    | true                                      { TmTrue }
    | false                                     { TmFalse } 
    | Exp '<' Exp                               { TmLessThan $1 $3 } 
	| Exp '==' Exp                              { TmEqualTo $1 $3 }
	| Type var '=' Exp                          { TmAssign $2 $4}  
    | Exp '+' Exp                               { TmAdd $1 $3 }
    | if Exp then Exp else Exp                  { TmIf $2 $4 $6 } 
    | '(' Exp ')'                               { $2 }
	| Exp ',' Exp								{ TmComma $1 $3 }
	| '[' Exp ']'								{ TmList $2 }
	| Exp ';' Exp                                { TmBreak $1 $3 }

Type : Bool            { TyBool } 
     | Int             { TyInt } 


{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Type = TyInt | TyBool 
   deriving (Show,Eq)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmLessThan Expr Expr 
            | TmAdd Expr Expr | TmVar String 
            | TmIf Expr Expr Expr 
            | TmComma Expr Expr | TmList Expr
			| TmAssign String Expr
			| TmEqualTo Expr Expr
			| TmBreak Expr Expr
    deriving (Show,Eq)
} 