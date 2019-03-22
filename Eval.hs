module Eval where
import Type
import Grammar
import Tokens
import System.Environment
import Control.Monad
import Data.List
import System.Directory
import System.IO

-- Look up a value in an environment and unpack it
getValueBinding :: String -> Environment -> (Expr,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = (e,(y,e):env)
                              | otherwise = getValueBinding x env

-- Update environment
update :: Environment -> String -> Expr -> Environment
update env x e = (x,e) : env

-- Checks for terminated expressions
isValue :: Expr -> Bool
isValue (TmInt _) = True
isValue TmTrue = True
isValue TmFalse = True
isValue _ = False


type State = (Expr, Environment) 

eval :: State -> State 
eval (TmInt n,env) = (TmInt n,env)
eval (TmTrue,env) = (TmTrue,env)
eval (TmFalse,env) = (TmFalse,env)
eval ((TmAssign t x e),env) = (e, update env x e)
eval ((TmVar x),env) = (e',env') 
                    where (e',env') = getValueBinding x env

eval ((TmLessThan (TmInt n1) (TmInt n2)),env) =
    if (n1 < n2)
    then (TmTrue,env)
    else (TmFalse,env)
	
eval ((TmEqualTo (TmInt n1) (TmInt n2)),env) = 
    if (n1 == n2)
    then (TmTrue,env)
    else (TmFalse,env)

	
eval (TmAdd (TmInt n1) (TmInt n2),env) = (TmInt (n1+n2),env)
eval (TmAdd e1 e2,env) = (eval ((TmAdd fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                    sndEval = fst (eval (e2,env))

eval (TmMulti (TmInt n1) (TmInt n2), env) = (TmInt (n1*n2),env)
eval (TmMulti e1 e2, env) = (eval ((TmMulti fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                         sndEval = fst (eval (e2,env))

eval (TmSubtract (TmInt n1) (TmInt n2), env) = (TmInt (n1-n2),env)
eval (TmSubtract e1 e2, env) = (eval ((TmSubtract fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                               sndEval = fst (eval (e2,env))
{-
eval (TmDivide (TmInt n1) (TmInt n2), env) = (TmInt (n1 / n2),env)
eval (TmDivide e1 e2, env) = (eval ((TmDivide fstEval sndEval),env)) where fstEval = fst (eval (e1,env))
                                                                           sndEval = fst (eval (e2,env))

-}

eval (TmIf e1 e2 e3 ,env) = if (fst (eval (e1,env)) == TmTrue) 
                            then (eval (e2,env)) 
                            else (eval (e3,env)) 

eval ((TmBreak e1 e2),env) = (eval (e2,env')) where (e,env') = eval (e1,env) 


		 
run :: Expr -> Expr
run e = fst $ (eval (e,[]))


printEval :: Expr -> String
printEval (TmInt n) = show n
printEval (TmTrue) = "True"
printEval (TmFalse) = "False"
printEval _ = "Evaluation unsuccessful"



--Take filename, return file content
perfectEval :: FilePath -> FilePath -> IO ()
perfectEval fileName programName = do r <- readFile fileName
                                      let eachLine = lines (r)
                                      let ls = map (split ' ') eachLine
                                      let stream = parseCalc (alexScanTokens (show ls))
                                      r2 <- readFile programName
                                      let parsedProg = parseCalc (alexScanTokens r2)
                                      let typeCheck = (result (typeof (parsedProg,[])))
                                      if (typeCheck == "No type error was found")
                                      --Evaluate if right type
                                      then putStrLn (printEval (fst (eval (parsedProg,[])))) 
                                      --Print error if not valid type
                                      else putStrLn (typeCheck)
							

split :: Eq a => a -> [a] -> [[a]]
split x xs | leftOver == [] = [taken]
             | otherwise = taken : split x (tail leftOver)
  where
    taken = takeWhile (/= x) xs
    leftOver = dropWhile (/= x) xs

processLine :: FilePath -> IO ()
processLine fileName = do r <- readFile fileName
                          let eachLine = lines (r)
                          eof <- isEOF
                          if (eof)
                          then putStrLn "LOL"
                          else (putStrLn (show eachLine))

-- Get nth list from the stream
getNthList :: [[String]] -> Int -> [String]
getNthList [] _ = []
getNthList (xs:xss) n = (xs!!n):(getNthList (xss) n)  


--Dont ask me to explain this, I just cant, will not be able to rewrite this (Created based on trial and error), basically it changes the stream to human-readable from
convertToString :: Expr -> [[String]]
convertToString (TmInt n) = [[(show n)]]
convertToString (TmList e1) = convertToString e1
convertToString (TmComma (TmList e1) (TmList e2)) = [(convertToString2 e1),(convertToString2 e2)]
convertToString (TmComma e1 (TmInt n)) = [(convertToString2 e1) ++[show n]]
convertToString (TmComma (TmList e1) e2) = [(convertToString2 e1)] ++ (convertToString e1)
convertToString (TmComma e1 (TmList e2)) = (convertToString e1) ++ [(convertToString2 e2)]
convertToString (TmComma e1 e2) = (convertToString e1) ++ (convertToString e2)


convertToString2 :: Expr -> [String]
convertToString2 (TmInt n) = [(show n)]
convertToString2 (TmComma e1 e2) = (convertToString2 e1) ++ (convertToString2 e2)

