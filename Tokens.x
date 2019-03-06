{ 
module ToyTokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+       ; 
  "#".*        ; 
  Bool           { tok (\p s -> TokenTypeBool p)} 
  Int            { tok (\p s -> TokenTypeInt p) }
  $digit+        { tok (\p s -> TokenInt p (read s)) }
  true           { tok (\p s -> TokenTrue p) }
  false          { tok (\p s -> TokenFalse p) }
  \<              { tok (\p s -> TokenLessThan p) }
  \+             { tok (\p s -> TokenPlus p) }
  if             { tok (\p s -> TokenIf p) }
  then           { tok (\p s -> TokenThen p) }
  else           { tok (\p s -> TokenElse p) }
  \\             { tok (\p s -> TokenLambda p) }
  \:             { tok (\p s -> TokenHasType p) }
  let            { tok (\p s -> TokenLet p )}
  =              { tok (\p s -> TokenEq p )}
  in             { tok (\p s -> TokenIn p )}
  \(             { tok (\p s -> TokenLParen p) }
  \)             { tok (\p s -> TokenRParen p) }
  $alpha [$alpha $digit \_ \’]*   { tok (\p s -> TokenVar p s) } 

{ 
-- Each action has type :: AlexPosn -> String -> MDLToken 

-- Helper function
tok f p s = f p s

-- The token type: 
data ToyToken = 
  TokenTypeBool AlexPosn         | 
  TokenTypeInt  AlexPosn         | 
  TokenInt AlexPosn Int          | 
  TokenTrue AlexPosn             |
  TokenFalse AlexPosn            |
  TokenLessThan AlexPosn         |
  TokenPlus AlexPosn             |
  TokenIf AlexPosn               |
  TokenThen AlexPosn             |
  TokenElse AlexPosn             |
  TokenLambda AlexPosn           |
  TokenHasType AlexPosn          |
  TokenLet AlexPosn              |
  TokenEq AlexPosn               |
  TokenIn AlexPosn               |
  TokenLParen AlexPosn           |
  TokenRParen AlexPosn           |
  TokenVar AlexPosn String
  deriving (Eq,Show) 

tokenPosn :: ToyToken -> String
tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLambda (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHasType (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLet (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIn  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)

}