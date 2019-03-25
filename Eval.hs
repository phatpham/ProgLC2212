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
getValueBinding x ((y,e):env) | x == y  = (e,(x,e):env)
                              | otherwise = getValueBinding x env

-- Update environment
update :: Environment -> String -> Expr -> Environment
update [] x e = [(x,e)]
update ((y,e1):env) x e2 | x == y  = ((y,e2):env)
                       | otherwise = (y,e1):update env x e2

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
eval (TmStream n,env) = (TmStream n,env)
eval (TmFalse,env) = (TmFalse,env)
eval ((TmAssign t x e),env) = (e, update env x $(fst(eval(e,env))))
eval ((TmVar x),env) = (e',env)
                    where (e',env') = getValueBinding x env

eval ((TmLessThan e1 e2),env) =
    if fst(eval (e1,env)) < fst(eval (e2,env))
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
eval ((TmWhile e1 e2),env) = if (fst (eval (e1,env)) == TmTrue)
                             then (eval ((TmWhile e1 e2),env'))
                             else eval (e2,env)
                                 where (e,env') = eval (e2,env)

eval (TmIf e1 e2 e3 ,env) = if (fst (eval (e1,env)) == TmTrue) 
                            then (eval (e2,env)) 
                            else (eval (e3,env)) 

eval ((TmBreak e1 e2),env) = (eval (e2,env')) where (e,env') = eval (e1,env) 

eval ((TmMap (TmStream e1) (TmAddFunc n)),env) = let ls = convertStream e1
                                                     mapedStream = myMap ls (TmAddFunc n)
                                                 in (parseCalc(alexScanTokens (show mapedStream)),env)

eval ((TmGetElem x n), env) = let i = parseAll (convertToString e')
                              in (parseCalc(alexScanTokens (show (i !! n))),env)
                                where (e',env') = getValueBinding x env

eval ((TmRemoveElem x n), env) = let i = parseAll (convertToString e')
                                 in (parseCalc(alexScanTokens (show (drop n i))),env)
                                   where (e',env') = getValueBinding x env


--get :: Int -> [[Int]] -> Int
--get n [[]] =

myMap :: [[Int]] -> Expr -> [[Int]]
myMap [[]] _ = [[]]
myMap (x:xs) (TmAddFunc n)
 | length xs > 0 = map (+n) x : myMap xs (TmAddFunc n)
 | otherwise = map (+n) x:[]



run :: Expr -> State
run e =  (eval (e,[]))

printEval :: State -> String
printEval ((TmInt n),env) = show n
printEval ((TmStream n),env) = show (convertStringToInt(convertToString n))
printEval ((TmTrue),env) = "True"
printEval ((TmFalse),env) = "False"
--printEval (TmBreak e1 (TmVar n)) = show n
--printEval (TmBreak e1 (TmAssign t x e)) = printEval e
--printEval ((TmAdd (TmInt n1) (TmInt n2)),env) = show (n1 + n2)
--printEval ((TmAssign t x e),env) = printEval e
printEval ((TmVar x),env) = show (fst(getValueBinding x env))
printEval s = show s

printStream :: String -> Environment -> State
printStream x [] = error "Variable bindings not found"
printStream x env = getValueBinding x env

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
                                      then writeFile "output.txt" (show (fst (eval (parsedProg,[("stream",stream)]))))
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

readLine :: Handle -> Int -> IO ()
readLine inh n =
    do ineof <- hIsEOF inh
       sourceText <- hGetLine inh
       if ineof
       then return()
       else
            do
               let eachLine = lines (sourceText)
               let ls = (map (split ' ') eachLine)
               let value = parseHead ls
               let parsedProg = parseCalc (alexScanTokens (show value))
               putStrLn (show parsedProg)
               readLine inh (n+1)


parseHead :: [[String]] -> [Int]
parseHead [[]] = []
parseHead ls = readInt (head ls)

parseAll :: [[String]] -> [[Int]]
parseAll [] = []
parseAll ls = readInt (head ls):parseAll (drop 1 ls)

-- Get nth list from the stream
getNthList :: [[String]] -> Int -> [String]
getNthList [] _ = []
getNthList (xs:xss) n = (xs!!n):(getNthList (xss) n)


convertStream :: Expr -> [[Int]]
convertStream e1 = convertStringToInt (convertToString e1)

--Everything is the same, I've just changed TmList to TmStream
convertToString :: Expr -> [[String]]
convertToString (TmInt n) = [[(show n)]]
convertToString (TmStream e1) = convertToString e1
convertToString (TmAdd (TmInt n1) (TmInt n2)) = [convertToString2 (TmAdd (TmInt n1) (TmInt n2))]
convertToString (TmComma (TmStream e1) (TmStream e2)) = [(convertToString2 e1),(convertToString2 e2)]
convertToString (TmComma e1 (TmInt n)) = [(convertToString2 e1) ++[show n]]
convertToString (TmComma (TmStream e1) e2) = [(convertToString2 e1)] ++ (convertToString e1)
convertToString (TmComma e1 (TmStream e2)) = (convertToString e1) ++ [(convertToString2 e2)]
convertToString (TmComma e1 e2) = (convertToString e1) ++ (convertToString e2)

convertToString2 :: Expr -> [String]
convertToString2 (TmInt n) = [(show n)]
convertToString2 (TmComma e1 e2) = (convertToString2 e1) ++ (convertToString2 e2)
convertToString2 (TmAdd (TmInt n1) (TmInt n2)) = [(show (n1+n2))]

convertStringToInt :: [[String]] -> [[Int]]
convertStringToInt [[]] = []
convertStringToInt (x:xs)
 | length xs > 0 = readInt x:convertStringToInt xs
 | otherwise = readInt x:[]

-- Converts the string input to Int values
readInt :: [String] -> [Int]
readInt [] = []
readInt (x:xs) = (read x::Int):(readInt xs)

convertToExpr :: [[Int]] -> Expr
convertToExpr ls = parseCalc (alexScanTokens (show ls))