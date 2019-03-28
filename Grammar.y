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
    Stream { TokenTypeStream _ }
    int    { TokenInt _ $$ }
    true   { TokenTrue _ }
    false  { TokenFalse _ }
    '<'    { TokenLessThan _ }
    '=='   { TokenEqualTo _ }
    '+'    { TokenPlus _ }
    '*'	   { TokenMulti _ }
    '-'    { TokenMinus _ }
    '/'    { TokenDivide _ }
    var    { TokenVar _ $$ }
    if     { TokenIf _ }
    then   { TokenThen _ }
    else   { TokenElse _ }
    '='    { TokenAssign _ }
    '('    { TokenLParen _ } 
    ')'    { TokenRParen _ } 
    '['	   { TokenLStream _ }
    ']'    { TokenRStream _ }
    ','	   { TokenComma _ }
    ';'    { TokenBreak _}
    '.'    { TokenApply _}
    while  { TokenWhile _ }
    '{'    { TokenLBracket _ }
    '}'    { TokenRBracket _ }
    get     { TokenGet _ }
    size    { TokenSize _ }
    add     { TokenAdd _ }
    remove   { TokenRemove _}
    insert   { TokenInsert _ }
    delete   { TokenDelete _ }
    zip      { TokenZip _  }
    getElem  { TokenGetElem _ }
    '\*'     { TokenCommentOpen _}
    '*/'     { TokenCommentClose _}

%nonassoc if
%nonassoc then
%nonassoc else
%nonassoc int true false var '(' ')'
%nonassoc map
%nonassoc stream
%nonassoc while
%nonassoc get
%nonassoc size
%nonassoc add
%nonassoc remove
%nonassoc insert
%nonassoc delete
%nonassoc zip
%nonassoc getElem
%left ';'
%left '<'
%right '='
%left '+'
%left '*'
%left '-'
%left '/'
%left ','
%left '.'
%right '=='
%right '['
%right '{'


%% 
Exp : int                                       { TmInt $1 }
    | var                                       { TmVar $1 }
    | true                                      { TmTrue }
    | false                                     { TmFalse }
    | Exp '<' Exp                               { TmLessThan $1 $3 } 
    | Exp '==' Exp                              { TmEqualTo $1 $3 }
    | Type var '=' Exp                          { TmAssign $1 $2 $4}  
    | Exp '+' Exp                               { TmAdd $1 $3 }
    | Exp '*' Exp                               { TmMulti $1 $3 }
    | Exp '-' Exp                               { TmSubtract $1 $3 }
    | Exp '/' Exp                               { TmDivide $1 $3 }
    | if Exp then Exp else Exp                  { TmIf $2 $4 $6 }
    | '(' Exp ')'                               { $2 }
    | Exp ',' Exp								 { TmComma $1 $3 }
    | while '(' Exp ')' '{' Exp '}'             { TmWhile $3 $6 }
    | '[' Exp ']'								 { TmStream $2 }
    | Exp ';' Exp                               { TmBreak $1 $3 }
    | var '.' get '(' Exp ')'                   { TmGet $1 $5 }
    | var '.' size '(' ')'                      { TmGetSize $1 }
    | var '.' add '(' Exp ')'                   { TmAddElem $1 $5 }
    | var '.' remove '(' Exp ')'                { TmRemoveElem $1 $5 }
    | var '.' insert '(' Exp ',' Exp  ')'        { TmInsertElem $1 $5 $7}
    | var '.' delete '(' Exp ')'                { TmDeleteElem $1 $5 }
    | var '.' zip '(' var ')'                   { TmZip $1 $5 }
    | var '.' getElem '(' Exp ',' Exp ')'       { TmGetElem $1 $5 $7 }
    | '\*' var '*/'                             { TmComment $2}

Type : Bool            { TyBool } 
     | Int             { TyInt }
     | Stream          { TyStream }



{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))


data Type = TyInt | TyBool | TyString | TyStream
   deriving (Show,Eq, Ord)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmLessThan Expr Expr 
            | TmAdd Expr Expr | TmVar String | TmMulti Expr Expr | TmSubtract Expr Expr | TmDivide Expr Expr
            | TmIf Expr Expr Expr 
            | TmComma Expr Expr | TmStream Expr | TmGet String Expr | TmGetSize String | TmAddElem String Expr
            | TmRemoveElem String Expr | TmInsertElem String Expr Expr | TmDeleteElem String Expr
			| TmAssign Type String Expr | TmWhile Expr Expr | TmZip String String | TmGetElem String Expr Expr
			| TmEqualTo Expr Expr
			| TmBreak Expr Expr
			| TmComment String
    deriving (Show,Eq, Ord)

} 
