{ 
module Tokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters


tokens :-
$white+       ; 
  "#".*        ; 
  "\n"          ;

  Bool           { tok (\p s -> TokenTypeBool p)     }
  Int            { tok (\p s -> TokenTypeInt p)      }
  $digit+        { tok (\p s -> TokenInt p (read s)) }
  \;             { tok (\p s -> TokenBreak p)        }
  "=="           { tok (\p s -> TokenEqualTo p)      }
  =              { tok (\p s -> TokenAssign p)       }
  true           { tok (\p s -> TokenTrue p)         }
  false          { tok (\p s -> TokenFalse p)        }
  if             { tok (\p s -> TokenIf p)           }
  then           { tok (\p s -> TokenThen p)         }
  else           { tok (\p s -> TokenElse p)         }
  \:             { tok (\p s -> TokenHasType p)      }
  \<             { tok (\p s -> TokenLessThan p)     }
  \+             { tok (\p s -> TokenPlus p)         }
  \*             { tok (\p s -> TokenMulti p)        }
  \-             { tok (\p s-> TokenMinus p)         }
  \/             { tok (\p s -> TokenDivide p)       }
  \(             { tok (\p s -> TokenLParen p)       }
  \)             { tok (\p s -> TokenRParen p)       }
  \[             { tok (\p s -> TokenLList p)        }
  \,             { tok (\p s -> TokenComma p)        }
  \]             { tok (\p s -> TokenRList p)        }
  $alpha [$alpha $digit \_ \’]*   { tok (\p s -> TokenVar p s) } 
  

{ 

-- Helper function
tok f p s = f p s

-- The token type: 
data Token = 
  TokenTypeBool AlexPosn         | 
  TokenTypeInt  AlexPosn         |
  TokenTypeFractional AlexPosn   |
  TokenInt AlexPosn Int          |
  TokenTrue AlexPosn             |
  TokenFalse AlexPosn            |
  TokenIf AlexPosn               |
  TokenThen AlexPosn             |
  TokenElse AlexPosn             |
  TokenHasType AlexPosn          |
  TokenEq AlexPosn               |
  TokenLParen AlexPosn           |
  TokenRParen AlexPosn           |
  TokenVar AlexPosn String       |
  TokenLessThan AlexPosn         |
  TokenPlus AlexPosn             |
  TokenMulti AlexPosn            |
  TokenMinus AlexPosn            |
  TokenDivide AlexPosn           |
  TokenEqualTo AlexPosn          |
  TokenComma AlexPosn            |
  TokenLList AlexPosn            |
  TokenRList AlexPosn            |
  TokenList AlexPosn             |
  TokenAssign AlexPosn           |
  TokenBreak AlexPosn            
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMulti (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDivide  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHasType (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRList (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLList (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenList (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqualTo (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAssign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBreak (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}