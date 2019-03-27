module Main where
import Tokens
import Grammar
import Eval
import Type
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do putStrLn ("Toy Interactive Mode - enter an expression : ")
           sourceText <- getLine
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))
           let typeCheck = (result (typeof (parsedProg,[])))
           if (typeCheck == "No type error was found")
           --Evaluate if right type
           then putStrLn (printEval (run parsedProg))
           --Print error if not valid type
           else putStrLn (typeCheck)
           main'

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               putStrLn("----------------")
               hPutStrLn stderr err
               putStrLn("----------------")
               main


