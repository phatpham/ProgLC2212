module Interpreter where
import Tokens
import Grammar
import Eval
import Type
import System.Environment
import Control.Exception
import System.IO
import System.Directory
import Data.Char(toUpper)

main :: String -> String -> IO ()
main fileName programName = do let args = [fileName,programName]
                               check args

check :: [String] -> IO()
check [] = error "Missing files"
check [f1,f2] = do ar1 <- doesFileExist f1
                   ar2 <- doesFileExist f2
                   interpret f1 ar1 f2 ar2
check _ = error "Incorrect argument, Expected: 1\n Usage: Interpreter.hs"

interpret :: String -> Bool -> String -> Bool -> IO ()
interpret ar1 f1 ar2 f2 | f1 && f2 = catch (perfectEval ar1 ar2) (noParse ar1 ar2)
                        | otherwise = error ("Source file doesn't exis")

{-
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

main' = do (filename : _) <- getArgs
           sourceText <- readFile filename
           let eachLine = lines (sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))
           let typeCheck = (result (typeof (parsedProg,[])))
           if (typeCheck == "No type error was found")
          --Evaluate if right type
           then putStrLn (printEval (run parsedProg))
          --Print error if not valid type
           else putStrLn (typeCheck)
           --main'
           --putStrLn (show x)
           --printResult ls
-}






noParse :: String -> String -> ErrorCall -> IO ()
noParse ar1 ar2 e = do let err =  show e
                       putStrLn("----------------")
                       hPutStrLn stderr err
                       putStrLn("----------------")
                       main ar1 ar2


