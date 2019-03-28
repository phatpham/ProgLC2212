module Eval where
import Type
import Grammar
import Tokens
import System.Environment
import Control.Monad
import Data.List
import System.Directory
import System.IO
import Text.Printf

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
    if parseExpr (fst(eval (e1,env))) < parseExpr (fst(eval (e2,env)))
    then (TmTrue,env)
    else (TmFalse,env)
	
eval ((TmEqualTo e1 e2),env) = 
    if parseExpr (fst(eval (e1,env))) == parseExpr (fst(eval (e2,env)))
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


eval ((TmWhile e1 e2),env) = if (fst (eval (e1,env)) == TmTrue)
                             then (eval ((TmWhile e1 e2),env'))
                             else (e2,env)
                                 where (e,env') = eval (e2,env)

eval (TmIf e1 e2 e3 ,env) = if (fst (eval (e1,env)) == TmTrue) 
                            then (eval (e2,env)) 
                            else (eval (e3,env)) 

eval ((TmBreak e1 e2),env) = (eval (e2,env')) where (e,env') = eval (e1,env) 



eval ((TmGet x (TmVar n)), env) = let i = parseAll (convertToString e')
                                      value = parseExpr (fst(getValueBinding n env))
                                  in (parseCalc(alexScanTokens (show (i !! value))),env)
                                    where (e',env') = getValueBinding x env

eval ((TmGet x n), env) = let i = parseAll (convertToString e')
                          in (parseCalc(alexScanTokens (show (i !! (parseExpr n)))),env)
                                where (e',env') = getValueBinding x env

eval ((TmRemoveElem x n), env) = let i = parseAll (convertToString e')
                                 in (parseCalc(alexScanTokens (show (drop (parseExpr(fst(eval (n,env)))) i))),update env x $(parseCalc(alexScanTokens (show (drop (parseExpr(fst(eval (n,env)))) i)))))
                                    where (e',env') = getValueBinding x env

eval ((TmAddElem x (TmStream (TmVar n))), env) = let i = parseAll (convertToString e')
                                                     value = (convertStream (fst(getValueBinding n env)))
                                                 in (parseCalc(alexScanTokens (show (i++(value)))),update env x $(parseCalc(alexScanTokens (show (i++(value))))))
                                                   where (e',env') = getValueBinding x env

eval ((TmAddElem x (TmStream n)), env) = let i = parseAll (convertToString e')
                              in (parseCalc(alexScanTokens (show (i++(convertStream n)))),update env x $(parseCalc(alexScanTokens (show (i++(convertStream n))))))
                                where (e',env') = getValueBinding x env


{-
eval ((TmAddElem x (TmInt n)), env) = let i = parseAll (convertToString e')
                              in (parseCalc(alexScanTokens (show ([n]:i))),update env x $(parseCalc(alexScanTokens (show ([n]:i)))))
                                where (e',env') = getValueBinding x env

-}

eval ((TmGetSize x), env) = let i = parseAll (convertToString e')
                            in (parseCalc(alexScanTokens (show (length i))),env)
                                where (e',env') = getValueBinding x env

eval ((TmDeleteElem x n), env) = let i = parseAll (convertToString e')
                                 in (parseCalc(alexScanTokens (show (deleteN (parseExpr(fst(eval (n,env)))) i))),update env x $(parseCalc(alexScanTokens (show (deleteN (parseExpr(fst(eval (n,env)))) i)))))
                                   where (e',env') = getValueBinding x env

eval ((TmZip x x1),env) = let i = parseAll (convertToString e')
                              i2 = parseAll (convertToString (fst(e2')))
                         in (parseCalc(alexScanTokens (show (zipStreams i i2))), update env x $ (parseCalc (alexScanTokens (show(zipStreams i i2)))))
                            where (e', env') = getValueBinding x env
                                  e2' = getValueBinding x1 env

eval ((TmGetElem x e1 listNumber), env) = let i = parseAll (convertToString e')
                                              n = parseExpr(fst(eval(e1,env)))
                                              n1 = parseExpr(fst(eval(listNumber,env)))
                                              elem = (i !! n1) !! n
                                          in (parseCalc (alexScanTokens (show (elem))),env)
                                            where (e', env') = getValueBinding x env


eval ((TmComment s),env) = ((TmComment s),env)

parseExpr :: Expr -> Int
parseExpr (TmInt n) =  n

zipStreams :: [[Int]] -> [[Int]] -> [[Int]]
zipStreams [] [] = []
zipStreams ls [] = ls
zipStreams [] ls = ls
zipStreams (x:xs) (y:ys) = (x ++ y):zipStreams xs ys


deleteN :: Int -> [a] -> [a]
deleteN _ []     = []
deleteN i (a:as)
   | i == 0    = as
   | otherwise = a : deleteN (i-1) as


run :: Expr -> State
run e =  (eval (e,[]))

printEval :: State -> String
printEval ((TmInt n),env) = show n
printEval ((TmStream n),env) = show (parseAll(convertToString n))
printEval ((TmTrue),env) = show "True"
printEval ((TmFalse),env) = show "False"
printEval ((TmVar x),env) = show (fst(getValueBinding x env))
printEval ((TmComment x),env) = show x
printEval s = show s

printStream :: String -> Environment -> State
printStream x [] = error "Variable bindings not found"
printStream x env = getValueBinding x env

--Take filename, return file content
perfectEval :: FilePath -> IO ()
perfectEval programName = do r <- getContents
                             let eachLine = lines (r)
                             let ls = map (split ' ') eachLine
                             let stream = parseCalc (alexScanTokens (show (parseAll ls)))
                             r2 <- readFile programName
                             let parsedProg = parseCalc (alexScanTokens r2)
                             let typeCheck = (result (typeof (parsedProg,[("stream",TyStream)])))
                             if (typeCheck == "No type error was found")
                             --Evaluate if right type
                             then putStr (formattedPrint (parseAll (convertToString (fst (eval (parsedProg,[("stream",stream)]))))))
                             --then putStrLn (show (fst(eval (parsedProg,[("stream",stream)]))))
                             --Print error if not valid type
                             else hPutStrLn stderr (error typeCheck)


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
convertStream e1 = parseAll (convertToString e1)

--Everything is the same, I've just changed TmList to TmStream
convertToString :: Expr -> [[String]]
convertToString (TmInt n) = [[(show n)]]
--convertToString (TmVar n) = [[convertToString (fst(getValueBinding x env))]]
convertToString (TmStream e1) = convertToString e1
--convertToString (TmStream (TmVar n)) =
convertToString (TmAdd (TmInt n1) (TmInt n2)) = [convertToString2 (TmAdd (TmInt n1) (TmInt n2))]
convertToString (TmComma (TmStream e1) (TmStream e2)) = [(convertToString2 e1),(convertToString2 e2)]
convertToString (TmComma e1 (TmInt n)) = [(convertToString2 e1) ++[show n]]
convertToString (TmComma (TmStream e1) e2) = [(convertToString2 e1)] ++ (convertToString e1)
convertToString (TmComma e1 (TmStream e2)) = (convertToString e1) ++ [(convertToString2 e2)]
convertToString (TmComma e1 e2) = (convertToString e1) ++ (convertToString e2)
--convertToString (TmStream s1 (TmVar n1)) = getValueBinding n1 env

convertToString2 :: Expr -> [String]
convertToString2 (TmInt n) = [(show n)]
convertToString2 (TmComma e1 e2) = (convertToString2 e1) ++ (convertToString2 e2)
convertToString2 (TmAdd (TmInt n1) (TmInt n2)) = [(show (n1+n2))]



-- Converts the string input to Int values
readInt :: [String] -> [Int]
readInt [] = []
readInt (x:xs) = (read x::Int):(readInt xs)

convertToExpr :: [[Int]] -> Expr
convertToExpr ls = parseCalc (alexScanTokens (show ls))

formattedPrint :: [[Int]] -> String
formattedPrint [xs] = (unwords $ map (printf "%d") (xs))
formattedPrint (xs:xss) = (unwords $ map (printf "%d") (xs)) ++ "\n" ++ formattedPrint (xss)
