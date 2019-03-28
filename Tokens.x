{ 
module Tokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters
$comment = [$alpha$digit]

tokens :-
$white+       ; 
  "#".*        ;
  "\n"          ;
  Bool           { tok (\p s -> TokenTypeBool p)     }
  Int            { tok (\p s -> TokenTypeInt p)      }
  Stream         { tok (\p s -> TokenTypeStream p)   }
  "-"* $digit+        { tok (\p s -> TokenInt p (read s)) }
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
  \[             { tok (\p s -> TokenLStream p)      }
  \,             { tok (\p s -> TokenComma p)        }
  \]             { tok (\p s -> TokenRStream p)      }
  \.             { tok (\p s -> TokenApply p)        }
  \{             { tok (\p s -> TokenLBracket p)     }
  \}             { tok (\p s -> TokenRBracket p)     }
  while          { tok (\p s -> TokenWhile p)        }
  get            { tok (\p s -> TokenGet p)          }
  size           { tok (\p s -> TokenSize p)         }
  add            { tok (\p s -> TokenAdd p)          }
  remove         { tok (\p s -> TokenRemove p)       }
  insert         { tok (\p s -> TokenInsert p)       }
  delete         { tok (\p s -> TokenDelete p)       }
  zip            { tok (\p s -> TokenZip p)       }
  getElem        { tok (\p s -> TokenGetElem p)       }
  $alpha [$alpha $digit \_ \’]*   { tok (\p s -> TokenVar p s) }
  "\*"           { tok (\p s -> TokenCommentOpen p)       }
  "*/"           { tok (\p s -> TokenCommentClose p)     }


{ 

-- Helper function
tok f p s = f p s

-- The token type: 
data Token = 
  TokenTypeBool AlexPosn         | 
  TokenTypeInt  AlexPosn         |
  TokenTypeStream AlexPosn       |
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
  TokenLStream AlexPosn          |
  TokenRStream AlexPosn          |
  TokenList AlexPosn             |
  TokenAssign AlexPosn           |
  TokenBreak AlexPosn            |
  TokenApply AlexPosn            |
  TokenLBracket AlexPosn         |
  TokenRBracket AlexPosn         |
  TokenWhile AlexPosn            |
  TokenGet AlexPosn              |
  TokenSize AlexPosn             |
  TokenAdd AlexPosn              |
  TokenRemove AlexPosn           |
  TokenInsert AlexPosn           |
  TokenDelete AlexPosn           |
  TokenZip AlexPosn              |
  TokenCommentOpen AlexPosn      |
  TokenCommentClose AlexPosn     |
  TokenGetElem AlexPosn
  deriving (Eq,Show)

tokenPosn :: Token -> String
tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeStream (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
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
tokenPosn (TokenRStream (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLStream (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenList (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqualTo (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAssign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBreak (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenApply (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGet (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSize (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAdd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRemove (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInsert (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDelete (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenZip (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCommentOpen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCommentClose (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGetElem (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}
